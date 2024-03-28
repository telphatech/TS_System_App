import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/login/employee_registration/data/models/employee_register_request_model.dart';
import 'package:ts_system/modules/login/employee_registration/domain/usecases/employee_register_usecase.dart';

import 'employee_register_event.dart';
import 'employee_register_state.dart';

class EmployeeRegisterBloc
    extends Bloc<EmployeeRegisterEvent, EmployeeRegisterState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController empIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? empId;

  bool showPassword = false;
  bool showConfPassword = false;
  EmployeeRegisterBloc() : super(EmployeeRegisterInitial()) {
    on<EmployeeRegisterChangePasswordEvent>((event, emit) {
      showPassword = !showPassword;
      emit(EmployeeRegisterInitial());
    });
    on<EmployeeRegisterChangeConfirmPasswordEvent>((event, emit) {
      showConfPassword = !showConfPassword;
      emit(EmployeeRegisterInitial());
    });
    on<EmployeeRegisterInitialEvent>(onEmployeeRegisterInitialEvent);
    on<StoreValuesEvent>((event, emit) {
      empId = event.invitationAttributesItems?.empInfo?.empId ?? "";
      nameController.text =
          event.invitationAttributesItems?.empInfo?.empName ?? "";
      empIdController.text =
          event.invitationAttributesItems?.empInfo?.empEmpRefId ?? "";
      phoneController.text =
          event.invitationAttributesItems?.empInfo?.empMobile ?? "";
      emailController.text =
          event.invitationAttributesItems?.empInfo?.empEmail ?? "";
    });
  }

  FutureOr<void> onEmployeeRegisterInitialEvent(
      EmployeeRegisterInitialEvent event,
      Emitter<EmployeeRegisterState> emit) async {
    emit(EmployeeRegisterLoading());

    if (passwordController.text == confPasswordController.text) {
      final repository = serviceLocator<EmployeeRegisterUseCase>();
      final response = await repository.invoke(EmployeeRegisterRequestModel(
        empId: empId,
        empPassword: passwordController.text,
      ));

      if (response.isLeft) {
        emit(EmployeeRegisterFailure());
      } else {
        try {
          if (response.right["status"] == "success") {
            emit(EmployeeRegisterSuccess(
                response.right["message"], response.right["status"]));
          } else {
            emit(EmployeeRegisterError(
                response.right["message"], response.right["status"]));
          }
        } catch (e) {
          emit(EmployeeRegisterFailure());
          Log.error(e.toString());
        }
      }
    }
  }
}
