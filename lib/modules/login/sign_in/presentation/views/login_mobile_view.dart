import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/login/sign_in/presentation/bloc/bloc/login_bloc.dart';
import 'package:ts_system/modules/login/sign_in/presentation/bloc/bloc/login_event.dart';
import 'package:ts_system/modules/login/sign_in/presentation/bloc/bloc/login_state.dart';
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

class LoginMobileView extends StatefulWidget {
  const LoginMobileView({super.key});

  @override
  State<LoginMobileView> createState() => _LoginMobileViewState();
}

class _LoginMobileViewState extends State<LoginMobileView> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CustomSnackBarService().showSuccessSnackBar(context,
                title: state.empLoginAttributesItems?.status ?? "",
                message: state.empLoginAttributesItems?.message ?? "");
            BlocProvider.of<LoginBloc>(context).refIdController.clear();
            BlocProvider.of<LoginBloc>(context).passwordController.clear();
            serviceLocator<AppRouter>().replace(const DashboardRoute());
          } else if (state is LoginError) {
            CustomSnackBarService().showErrorSnackBar(context,
                title: state.empLoginAttributesItems?.status ?? "",
                message: state.empLoginAttributesItems?.message ?? "");
          } else if (state is InvitationCodeError) {
            CustomSnackBarService()
                .showErrorSnackBar(context, message: "Invalid invitation code");
            BlocProvider.of<LoginBloc>(context).codeController.clear();
            serviceLocator<AppRouter>().pop();
          } else if (state is InvitationCodeFailure) {
            CustomSnackBarService()
                .showErrorSnackBar(context, message: "Something went Wrong!!");
            BlocProvider.of<LoginBloc>(context).codeController.clear();
            serviceLocator<AppRouter>().pop();
          } else if (state is InvitationCodeSuccess) {
            BlocProvider.of<LoginBloc>(context).codeController.clear();
            serviceLocator<AppRouter>().replace(EmployeeRegistrationRoute(
                invitationAttributesItems: state.invitationAttributesItems));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Form(
                  key: BlocProvider.of<LoginBloc>(context).formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 67),
                          child: Text(
                            'TM System',
                            style: TTypography.text20PrimaryColor.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 48,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          'Sign In',
                          style: TTypography.text20BlackColor.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      UIHelpers.verticalSpaceTiny,
                      Text(
                        'Add or select your details to continue',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TTypography.text16Grey,
                      ),
                      UIHelpers.verticalSpaceLarge,
                      AppInputField(
                        leading: const Icon(
                          Icons.person,
                          color: TTColors.primary,
                        ),
                        controller:
                            BlocProvider.of<LoginBloc>(context).refIdController,
                        label: 'Employee ID',
                        hint: 'Enter your Employee ID',
                        validator: (value) {
                          if (value?.startsWith('TM') != true) {
                            return 'Please enter valid Telphatech ID';
                          } else {
                            return null;
                          }
                        },
                      ),
                      UIHelpers.verticalSpaceMedium,
                      AppInputField(
                        label: 'Password',
                        hint: 'Enter your Password',
                        controller: BlocProvider.of<LoginBloc>(context)
                            .passwordController,
                        leading: const Icon(
                          Icons.lock_open_rounded,
                          color: TTColors.primary,
                        ),
                        validator: (value) => Validations.requireField(value),
                        password:
                            Provider.of<LoginBloc>(context).isPasswordVisible ==
                                    false
                                ? true
                                : false,
                        trailing: IconButton(
                          icon: Icon(
                            Provider.of<LoginBloc>(context).isPasswordVisible
                                ? TTIcons.visibilityOff
                                : TTIcons.visibility,
                            color: TTColors.primary,
                          ),
                          onPressed: () {
                            Provider.of<LoginBloc>(context, listen: false)
                                .add(PassToggleEvent());
                          },
                        ),
                      ),
                      UIHelpers.verticalSpaceMedium,
                      CheckboxMenuButton(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                          child: Text(
                            'Keep me logged In',
                            style: TTypography.text16Black,
                          )),
                      UIHelpers.verticalSpaceMedium,
                      CustomElevatedButton(
                        onPressed: () {
                          if (BlocProvider.of<LoginBloc>(context)
                                  .formKey
                                  .currentState
                                  ?.validate() ??
                              false) {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginInitialEvent(
                                    refId: BlocProvider.of<LoginBloc>(context)
                                        .refIdController
                                        .text,
                                    password:
                                        BlocProvider.of<LoginBloc>(context)
                                            .passwordController
                                            .text));
                          } else if (state is LoginError) {
                            CustomSnackBarService().showErrorSnackBar(context,
                                title:
                                    state.empLoginAttributesItems?.status ?? "",
                                message:
                                    state.empLoginAttributesItems?.message ??
                                        "");
                          } else {
                            CustomSnackBarService().showErrorSnackBar(context,
                                message: 'Please enter all fields');
                          }
                        },
                        backgroundColor: TTColors.primary,
                        borderColor: TTColors.primary,
                        iconColor: TTColors.white,
                        child: SizedBox(
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return LoadingAnimationWidget
                                    .horizontalRotatingDots(
                                        color: TTColors.white,
                                        size: UIHelpers.screenWidth(context) *
                                            0.15);
                              } else {
                                return Text(
                                  AppUtils.signIn,
                                  style: TTypography.normal.copyWith(
                                      color: TTColors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      UIHelpers.verticalSpaceSmall,
                      CustomElevatedButton(
                        onPressed: () {
                          final loginBloc = BlocProvider.of<LoginBloc>(context);

                          showDialog(
                            context: context,
                            builder: (context) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  dialogTheme: DialogTheme(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                child: Dialog(
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          'Enter Your Code',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        AppInputField(
                                          hint: 'Enter your code',
                                          controller: loginBloc.codeController,
                                          inputBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 2.0,
                                            ),
                                          ),
                                          enabledBorderColor: TTColors.primary,
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: CustomElevatedButton(
                                                  onPressed: () {
                                                    serviceLocator<AppRouter>()
                                                        .pop();
                                                  },
                                                  backgroundColor:
                                                      TTColors.primary,
                                                  borderColor: TTColors.primary,
                                                  iconColor: TTColors.white,
                                                  child: const Text(
                                                    "Close",
                                                    overflow: TextOverflow.clip,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  )),
                                            ),
                                            UIHelpers.horizontalSpaceTiny,
                                            Expanded(
                                              child: CustomElevatedButton(
                                                  onPressed: () {
                                                    if (loginBloc.codeController
                                                        .text.isNotEmpty) {
                                                      loginBloc.add(
                                                          InvitationCodeEvent(
                                                              loginBloc
                                                                  .codeController
                                                                  .text));
                                                    } else {
                                                      serviceLocator<
                                                              CustomSnackBarService>()
                                                          .showWarningSnackBar(
                                                              context,
                                                              message:
                                                                  "Please enter your invitation code");
                                                      serviceLocator<
                                                              AppRouter>()
                                                          .pop();
                                                    }
                                                  },
                                                  backgroundColor:
                                                      TTColors.primary,
                                                  borderColor: TTColors.primary,
                                                  iconColor: TTColors.white,
                                                  child: Text(
                                                    "Proceed",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TTypography.normal
                                                        .copyWith(
                                                      color: TTColors.white,
                                                      fontSize:
                                                          UIHelpers.screenWidth(
                                                                  context) *
                                                              0.028,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        backgroundColor: TTColors.white,
                        borderColor: TTColors.primary,
                        iconColor: TTColors.primary,
                        child: AppText.body('I have an Invitation Code'),
                      ),
                      UIHelpers.verticalSpaceMedium,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
