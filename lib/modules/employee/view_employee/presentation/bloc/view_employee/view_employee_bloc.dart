import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/employee/view_employee/data/models/employee.dart';
import 'package:ts_system/modules/employee/view_employee/data/models/employee_request_model.dart';
import 'package:ts_system/modules/employee/view_employee/domain/entities/view_employee_attributes_item.dart';
import 'package:ts_system/modules/employee/view_employee/domain/usecases/invite_employee_usecases.dart';
import 'package:ts_system/modules/employee/view_employee/domain/usecases/view_employee_usecases.dart';
import 'view_employee_event.dart';
import 'view_employee_state.dart';

class ViewEmployeeBloc extends Bloc<ViewEmployeeEvent, ViewEmployeeState> {
  final TextEditingController empIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? role;
  String? status;
  String? position;

  List<String> roleList = ["admin", "employee", "manager"];
  List<String> statusList = ["onJob", "Terminated"];
  List<String> positionList = [
    "Full stack Developer Intern",
    "Flutter Developer Intern",
    "Java Developer Intern",
    "Software Engineer Intern"
  ];
  final formKey = GlobalKey<FormState>();
  List<ViewEmployeeAttributesItems?> viewEmployeeAttributesItems = [];

  ViewEmployeeBloc() : super(ViewEmployeeInitial()) {
    on<ViewEmployeeInitialEvent>(viewEmployeeInitialEvent);
    on<InviteEmployeeInitialEvent>(onInviteEmployeeEvent);
  }

  FutureOr<void> onInviteEmployeeEvent(
      InviteEmployeeInitialEvent event, Emitter<ViewEmployeeState> emit) async {
    emit(InviteEmployeeLoading());

    final repository = serviceLocator<InviteEmployeeUseCase>();
    final response = await repository.invoke(EmployeeRequestModel(
      empEmpRefId: empIdController.text,
      empName: nameController.text,
      empEmail: emailController.text,
      empMobile: mobileController.text,
      empRole: role,
      empPosition: position,
      empStatus: status,
    ));

    if (response.isLeft) {
      emit(InviteEmployeeFailure());
    } else {
      try {
        if (response.right["status"] == "success") {
          emit(InviteEmployeeSuccess(
              message: response.right["message"],
              status: response.right["status"]));
        } else {
          emit(InviteEmployeeError(
              message: response.right["message"],
              status: response.right["status"]));
        }
      } catch (e) {
        emit(InviteEmployeeFailure());
      }
    }
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
