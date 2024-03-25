import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/login/sign_in/data/models/login.dart';
import 'package:ts_system/modules/login/sign_in/domain/entities/login_attributes.dart';
import 'package:ts_system/modules/login/sign_in/domain/usecases/login_usecases.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController refIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginAttributesItems? empLoginAttributesItems;
  final sharedPreferenceService = serviceLocator<SharedPreferenceService>();

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<LoginInitialEvent>(empLoginInitialEvent);
  }

  Future<void> empLoginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final repository = serviceLocator<LoginUseCase>();
    final response = await repository.invoke({
      "emp_emp_ref_id": event.refId,
      "emp_password": event.password,
    });

    if (response.isLeft) {
      emit(LoginFailure());
    } else {
      try {
        final empLoginModel = empLoginFromJson(jsonEncode(response.right));
        empLoginAttributesItems = LoginAttributesItems(
          message: empLoginModel.message ?? "",
          status: empLoginModel.status ?? "",
          empInfo: EmpInfoAttributesItems(
            empId: empLoginModel.empInfo?.empId ?? "",
            empEmpRefId: empLoginModel.empInfo?.empEmpRefId ?? "",
            empName: empLoginModel.empInfo?.empName ?? "",
            empEmail: empLoginModel.empInfo?.empEmail ?? "",
            empPassword: empLoginModel.empInfo?.empPassword ?? "",
            empRole: empLoginModel.empInfo?.empRole ?? "",
            empPosition: empLoginModel.empInfo?.empPosition ?? "",
            empStatus: empLoginModel.empInfo?.empStatus ?? "",
            empToken: empLoginModel.empInfo?.empToken ?? "",
            empTokenAddTime: empLoginModel.empInfo?.empTokenAddTime ?? "",
            empIsdeleted: empLoginModel.empInfo?.empIsdeleted ?? "",
          ),
          token: empLoginModel.token ?? "",
        );

        if (empLoginAttributesItems?.status == "success") {
          refIdController.clear();
          passwordController.clear();
          sharedPreferenceService.empID =
              empLoginAttributesItems?.empInfo?.empEmpRefId ?? "";
          sharedPreferenceService.email =
              empLoginAttributesItems?.empInfo?.empEmail ?? "";
          sharedPreferenceService.name =
              empLoginAttributesItems?.empInfo?.empName ?? "";
          sharedPreferenceService.role =
              empLoginAttributesItems?.empInfo?.empRole ?? "";
          sharedPreferenceService.isLoggedIn = true;

          emit(LoginSuccess(empLoginAttributesItems));
        } else {
          emit(LoginError(empLoginAttributesItems));
        }
      } catch (e) {
        emit(LoginFailure());
        Log.error(e.toString());
      }
    }
  }
}
