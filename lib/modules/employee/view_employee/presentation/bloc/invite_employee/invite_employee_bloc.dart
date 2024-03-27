import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/employee/view_employee/data/models/employee_request_model.dart';
import 'package:ts_system/modules/employee/view_employee/domain/usecases/invite_employee_usecases.dart';

import 'invite_employee_event.dart';
import 'invite_employee_state.dart';

class InviteEmployeeBloc
    extends Bloc<InviteEmployeeEvent, InviteEmployeeState> {
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

  InviteEmployeeBloc() : super(InviteEmployeeInitial()) {
    on<InviteEmployeeInitialEvent>(onInviteEmployeeEvent);
  }

  FutureOr<void> onInviteEmployeeEvent(InviteEmployeeInitialEvent event,
      Emitter<InviteEmployeeState> emit) async {
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
}
