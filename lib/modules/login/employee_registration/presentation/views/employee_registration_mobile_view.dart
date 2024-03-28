import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/login/employee_registration/presentation/bloc/bloc/employee_register_bloc.dart';
import 'package:ts_system/modules/login/employee_registration/presentation/bloc/bloc/employee_register_event.dart';
import 'package:ts_system/modules/login/employee_registration/presentation/bloc/bloc/employee_register_state.dart';
import 'package:ts_system/modules/login/sign_in/domain/entities/invitation_attributes.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class EmployeeRegistrationMobileView extends StatelessWidget {
  final InvitationAttributesItems? invitationAttributesItems;
  const EmployeeRegistrationMobileView(
      {super.key, required this.invitationAttributesItems});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeRegisterBloc()
        ..add(StoreValuesEvent(
          invitationAttributesItems: invitationAttributesItems,
        )),
      child: BlocConsumer<EmployeeRegisterBloc, EmployeeRegisterState>(
        listener: (context, state) {
          if (state is EmployeeRegisterSuccess) {
            serviceLocator<CustomSnackBarService>().showSuccessSnackBar(
              context,
              message: state.message,
            );
            serviceLocator<AppRouter>().popAndPush(const LoginRoute());
          } else if (state is EmployeeRegisterError) {
            serviceLocator<CustomSnackBarService>().showWarningSnackBar(
              context,
              message: state.message,
            );
          } else if (state is EmployeeRegisterFailure) {
            serviceLocator<CustomSnackBarService>().showErrorSnackBar(
              context,
              message: AppUtils.resourceErrorMessage,
            );
          }
        },
        builder: (context, state) {
          final registerBloc = BlocProvider.of<EmployeeRegisterBloc>(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Column(
                  children: [
                    Text(
                      AppUtils.welcome,
                      style: TTypography.normal.copyWith(
                          fontSize: 32.0, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      AppUtils.fillTheForm,
                      overflow: TextOverflow.clip,
                      style: TTypography.normal.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.w400),
                    ),
                    UIHelpers.verticalSpaceMedium,
                    Form(
                      key: registerBloc.formKey,
                      child: Column(
                        children: [
                          AppInputField(
                            leading: const Icon(Icons.person,
                                color: TTColors.primary),
                            controller: registerBloc.empIdController,
                            readOnly: true,
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            leading: const Icon(Icons.person,
                                color: TTColors.primary),
                            controller: registerBloc.nameController,
                            readOnly: true,
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            leading: const Icon(Icons.email_rounded,
                                color: TTColors.primary),
                            controller: registerBloc.emailController,
                            readOnly: true,
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            leading: const Icon(Icons.phone_android_rounded,
                                color: TTColors.primary),
                            controller: registerBloc.phoneController,
                            readOnly: true,
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            leading: const Icon(Icons.lock_rounded,
                                color: TTColors.primary),
                            hint: 'Enter your Password',
                            password: !registerBloc.showPassword,
                            validator: (value) =>
                                Validations.passwordValidation(value),
                            trailing: IconButton(
                              icon: Icon(
                                registerBloc.showPassword
                                    ? TTIcons.visibilityOff
                                    : TTIcons.visibility,
                                color: TTColors.primary,
                              ),
                              onPressed: () {
                                registerBloc
                                    .add(EmployeeRegisterChangePasswordEvent());
                              },
                            ),
                            controller: registerBloc.passwordController,
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            hint: 'Enter your Confirm Password',
                            leading: const Icon(Icons.lock_rounded,
                                color: TTColors.primary),
                            password: !registerBloc.showConfPassword,
                            validator: (value) =>
                                Validations.passwordValidation(value),
                            trailing: IconButton(
                              icon: Icon(
                                registerBloc.showConfPassword
                                    ? TTIcons.visibilityOff
                                    : TTIcons.visibility,
                                color: TTColors.primary,
                              ),
                              onPressed: () {
                                registerBloc.add(
                                    EmployeeRegisterChangeConfirmPasswordEvent());
                              },
                            ),
                            controller: registerBloc.confPasswordController,
                          ),
                        ],
                      ),
                    ),
                    UIHelpers.verticalSpaceMedium,
                    SizedBox(
                      width: double.infinity,
                      child: state is EmployeeRegisterLoading
                          ? CustomElevatedButton(
                              onPressed: () {},
                              backgroundColor: TTColors.primary,
                              borderColor: TTColors.primary,
                              iconColor: TTColors.white,
                              child:
                                  LoadingAnimationWidget.horizontalRotatingDots(
                                      color: TTColors.white,
                                      size:
                                          UIHelpers.screenWidth(context) * 0.1))
                          : CustomElevatedButton(
                              onPressed: () {
                                if (registerBloc.formKey.currentState
                                        ?.validate() ==
                                    true) {
                                  if (registerBloc.passwordController.text ==
                                      registerBloc
                                          .confPasswordController.text) {
                                    registerBloc
                                        .add(EmployeeRegisterInitialEvent());
                                  } else {
                                    serviceLocator<CustomSnackBarService>()
                                        .showWarningSnackBar(context,
                                            message:
                                                'Password and Confirm Password Should be same');
                                  }
                                } else {
                                  serviceLocator<CustomSnackBarService>()
                                      .showWarningSnackBar(context,
                                          message:
                                              'Please enter your password');
                                }
                              },
                              backgroundColor: TTColors.primary,
                              borderColor: TTColors.primary,
                              iconColor: TTColors.white,
                              child: AppText.body(
                                "Register",
                                color: TTColors.white,
                              )),
                    ),
                    UIHelpers.verticalSpaceSmall,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
