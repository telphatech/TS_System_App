import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: TTColors.primary,
                          ),
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
                        child: const Text('Sign In'),
                      ),
                      UIHelpers.verticalSpaceSmall,
                      CustomElevatedButton(
                        onPressed: () {
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
                                                  child: Text(
                                                    "Close",
                                                    overflow: TextOverflow.clip,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  iconColor: TTColors.white),
                                            ),
                                            UIHelpers.horizontalSpaceTiny,
                                            Expanded(
                                              child: CustomElevatedButton(
                                                  onPressed: () {},
                                                  backgroundColor:
                                                      TTColors.primary,
                                                  borderColor: TTColors.primary,
                                                  child: Text(
                                                    "Proceed",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  iconColor: TTColors.white),
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
