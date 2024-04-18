import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/common/text_style.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/modules/login/sign_in/presentation/bloc/bloc/login_bloc.dart';
import 'package:ts_system/modules/login/sign_in/presentation/bloc/bloc/login_event.dart';
import 'package:ts_system/modules/login/sign_in/presentation/bloc/bloc/login_state.dart';

class LoginDesktopView extends StatefulWidget {
  const LoginDesktopView({super.key});

  @override
  State<LoginDesktopView> createState() => _LoginDesktopViewState();
}

class _LoginDesktopViewState extends State<LoginDesktopView> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CustomSnackBarService().showSuccessSnackBar(
              context,
              title: state.empLoginAttributesItems?.status ?? "",
              message: state.empLoginAttributesItems?.message ?? "",
            );
            BlocProvider.of<LoginBloc>(context).refIdController.clear();
            BlocProvider.of<LoginBloc>(context).passwordController.clear();
            serviceLocator<AppRouter>().replace(const DashboardRoute());
          } else if (state is LoginError) {
            CustomSnackBarService().showErrorSnackBar(
              context,
              title: state.empLoginAttributesItems?.status ?? "",
              message: state.empLoginAttributesItems?.message ?? "",
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: TTColors.white,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: TTColors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                        ),
                        UIHelpers.verticalSpaceSmall,
                        Text(
                          "TM SYSTEM",
                          style: heading1Style.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        const Text("Empowering Employee Growth"),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 2, height: double.infinity, color: TTColors.grey),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 24, top: 14),
                    decoration: const BoxDecoration(color: TTColors.white),
                    alignment: Alignment.centerLeft,
                    child: Form(
                      key: BlocProvider.of<LoginBloc>(context).formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("SIGN IN", style: heading1Style),
                          Text(
                            "Please login to continue to your account.",
                            style: TTypography.normal
                                .copyWith(color: TTColors.grey),
                          ),
                          UIHelpers.verticalSpaceMedium,
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: AppInputField(
                              hint: 'Enter your employee ID',
                              label: 'Employee ID',
                              validator: (value) {
                                if (value?.startsWith('TM') != true) {
                                  return 'Please enter valid Telphatech ID';
                                } else {
                                  return null;
                                }
                              },
                              controller: BlocProvider.of<LoginBloc>(context)
                                  .refIdController,
                              leading: const Icon(
                                Icons.person,
                                color: TTColors.primary,
                              ),
                            ),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: AppInputField(
                              hint: 'Enter your Password',
                              controller: BlocProvider.of<LoginBloc>(context)
                                  .passwordController,
                              leading: const Icon(
                                Icons.lock,
                                color: TTColors.primary,
                              ),
                              validator: (value) =>
                                  Validations.requireField(value),
                              password: Provider.of<LoginBloc>(context)
                                          .isPasswordVisible ==
                                      false
                                  ? true
                                  : false,
                              label: 'Password',
                              trailing: IconButton(
                                icon: Icon(
                                  Provider.of<LoginBloc>(context)
                                          .isPasswordVisible
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
                          ),
                          UIHelpers.verticalSpaceSmall,
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
                            ),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: CustomElevatedButton(
                                onPressed: () {
                                  if (BlocProvider.of<LoginBloc>(context)
                                          .formKey
                                          .currentState
                                          ?.validate() ??
                                      false) {
                                    BlocProvider.of<LoginBloc>(context).add(
                                        LoginInitialEvent(
                                            refId: BlocProvider.of<LoginBloc>(
                                                    context)
                                                .refIdController
                                                .text,
                                            password:
                                                BlocProvider.of<LoginBloc>(
                                                        context)
                                                    .passwordController
                                                    .text));
                                  } else if (state is LoginError) {
                                    CustomSnackBarService().showErrorSnackBar(
                                        context,
                                        title: state.empLoginAttributesItems
                                                ?.status ??
                                            "",
                                        message: state.empLoginAttributesItems
                                                ?.message ??
                                            "");
                                  } else {
                                    CustomSnackBarService().showErrorSnackBar(
                                        context,
                                        message: 'Please enter all fields');
                                  }
                                },
                                backgroundColor: TTColors.primary,
                                borderColor: TTColors.primary,
                                iconColor: TTColors.white,
                                child: const Text('Sign In'),
                              ),
                            ),
                          ),
                          UIHelpers.verticalSpaceMedium,
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: SizedBox(
                              width: double.infinity,
                              child: CustomElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          dialogTheme: DialogTheme(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        child: Dialog(
                                          child: Container(
                                            width: 400,
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                                  inputBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade400,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  enabledBorderColor:
                                                      TTColors.primary,
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          CustomElevatedButton(
                                                              onPressed: () {
                                                                serviceLocator<
                                                                        AppRouter>()
                                                                    .pop();
                                                              },
                                                              backgroundColor:
                                                                  TTColors
                                                                      .primary,
                                                              borderColor:
                                                                  TTColors
                                                                      .primary,
                                                              iconColor:
                                                                  TTColors
                                                                      .white,
                                                              child: const Text(
                                                                "Close",
                                                                overflow:
                                                                    TextOverflow
                                                                        .clip,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              )),
                                                    ),
                                                    UIHelpers
                                                        .horizontalSpaceTiny,
                                                    Expanded(
                                                      child:
                                                          CustomElevatedButton(
                                                              onPressed: () {},
                                                              backgroundColor:
                                                                  TTColors
                                                                      .primary,
                                                              borderColor:
                                                                  TTColors
                                                                      .primary,
                                                              iconColor:
                                                                  TTColors
                                                                      .white,
                                                              child: const Text(
                                                                "Proceed",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
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
                                child:
                                    AppText.body('I have an Invitation Code'),
                              ),
                            ),
                          ),
                          UIHelpers.verticalSpaceMedium,
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Text(
                                'Powered By Telphatech LLP',
                                style: TTypography.text20Bold
                                    .copyWith(color: TTColors.primary),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
