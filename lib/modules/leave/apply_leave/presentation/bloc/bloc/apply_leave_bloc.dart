import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/dashboard/data/models/response_model.dart';
import 'package:ts_system/modules/dashboard/domain/entities/response_attributes.dart';
import 'package:ts_system/modules/leave/apply_leave/data/models/apply_leave_request_model.dart';
import 'package:ts_system/modules/leave/apply_leave/domain/usecases/apply_leave_usecase.dart';

part 'apply_leave_event.dart';
part 'apply_leave_state.dart';

class ApplyLeaveBloc extends Bloc<ApplyLeaveEvent, ApplyLeaveState> {
  final TextEditingController leaveFromController = TextEditingController();
  final TextEditingController leaveToController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final key = GlobalKey<FormState>();
  String? selectedLeaveType;
  List<String> leaveTypeList = const ['casual', 'sick', 'unleave'];

  ApplyLeaveBloc() : super(ApplyLeaveInitial()) {
    on<ApplyLeaveEvent>((event, emit) {});
    on<ApplyLeaveInitialEvent>(onApplyLeave);
  }

  ResponseAttributesItems? responseAttributesItems;

  FutureOr<void> onApplyLeave(
    ApplyLeaveInitialEvent event,
    Emitter<ApplyLeaveState> emit,
  ) async {
    emit(ApplyLeaveLoading());

    final repository = serviceLocator<ApplyLeaveUseCase>();
    final response = await repository.invoke(ApplyLeaveRequestModel(
      leaveEmpId: serviceLocator<SharedPreferenceService>().empID,
      leaveType: selectedLeaveType,
      leaveTo: toDateController.text,
      leaveFrom: fromDateController.text,
      leaveReason: reasonController.text,
    ));

    if (response.isLeft) {
      emit(ApplyLeaveFailure());
    } else {
      try {
        final model = responseModelFromJson(jsonEncode(response.right));

        responseAttributesItems = ResponseAttributesItems(
          message: model.message ?? "",
          status: model.status ?? "",
        );

        if (model.status == "success") {
          emit(ApplyLeaveSuccess(
            responseAttributesItems: responseAttributesItems,
          ));
          serviceLocator<AppRouter>().replace(const LeaveDashboard());
        } else {
          emit(ApplyLeaveError(
            responseAttributesItems: responseAttributesItems,
          ));
        }
      } catch (e) {
        emit(ApplyLeaveFailure());
      }
    }
  }
}
