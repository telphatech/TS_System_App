import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/employee/view_employee/data/models/employee.dart';
import 'package:ts_system/modules/employee/view_employee/domain/entities/view_employee_attributes_item.dart';
import 'package:ts_system/modules/employee/view_employee/domain/usecases/view_employee_usecases.dart';
import 'view_employee_event.dart';
import 'view_employee_state.dart';

class ViewEmployeeBloc extends Bloc<ViewEmployeeEvent, ViewEmployeeState> {
  List<ViewEmployeeAttributesItems?> viewEmployeeAttributesItems = [];

  ViewEmployeeBloc() : super(ViewEmployeeInitial()) {
    on<ViewEmployeeEvent>((event, emit) {});

    on<ViewEmployeeInitialEvent>(viewEmployeeInitialEvent);
  }

  Future<void> viewEmployeeInitialEvent(
      ViewEmployeeInitialEvent event, Emitter<ViewEmployeeState> emit) async {
    emit(ViewEmployeeLoading());
    final repository = serviceLocator<ViewEmployeeUseCase>();
    final response = await repository.invoke();

    if (response.isLeft) {
      emit(ViewEmployeeFailure());
    } else {
      try {
        final viewEmployeeModel = employeeFromJson(jsonEncode(response.right));

        if (viewEmployeeModel.isEmpty) {
          emit(ViewEmployeeEmpty());
        } else {
          viewEmployeeAttributesItems = viewEmployeeModel
              .map((e) => ViewEmployeeAttributesItems(
                    empEmpRefId: e.empEmpRefId ?? "",
                    empName: e.empName ?? "",
                    empEmail: e.empEmail ?? "",
                    empPassword: e.empPassword ?? "",
                    empRole: e.empRole ?? "",
                    empPosition: e.empPosition ?? "",
                    empStatus: e.empStatus ?? "",
                  ))
              .toList();

          emit(ViewEmployeeSuccess(viewEmployeeAttributesItems));
        }
      } catch (e) {
        emit(ViewEmployeeFailure());
        Log.error(e.toString());
      }
    }
  }
}
