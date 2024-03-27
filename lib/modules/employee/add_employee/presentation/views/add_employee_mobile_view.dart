import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_bloc.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_event.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_state.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/widgets/desktop_app_bar.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

@RoutePage()
class AddEmployeeMobileView extends StatefulWidget {
  const AddEmployeeMobileView({super.key});

  @override
  State<AddEmployeeMobileView> createState() => _AddEmployeeMobileViewState();
}

class _AddEmployeeMobileViewState extends State<AddEmployeeMobileView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        serviceLocator<AppRouter>().replace(const ViewEmployeeRoute());
      },
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? null : const MenuDrawer(),
        appBar: Responsive.isMobile(context)
            ? AppBar(
                leading: IconButton(
                  onPressed: () {
                    serviceLocator<AppRouter>()
                        .replace(const ViewEmployeeRoute());
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: TTColors.white,
                  ),
                ),
                backgroundColor: TTColors.primary,
                iconTheme: const IconThemeData(color: TTColors.white),
                title: const Text(
                  'ADD EMPLOYEE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                centerTitle: true,
              )
            : const PreferredSize(
                preferredSize: Size(double.infinity, kToolbarHeight),
                child: AppBarDesktopWidget()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
            child: BlocProvider(
              create: (context) =>
                  ViewEmployeeBloc()..add(InviteEmployeeInitialEvent()),
              child: BlocConsumer<ViewEmployeeBloc, ViewEmployeeState>(
                listener: (context, state) {
                  if (state is InviteEmployeeSuccess) {
                    CustomSnackBarService()
                        .showSuccessSnackBar(context, message: state.message);
                  } else if (state is InviteEmployeeFailure) {
                    CustomSnackBarService().showErrorSnackBar(context,
                        message: "Something went wrong!!");
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<ViewEmployeeBloc>(context).formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.headingOne("Invite Employee"),
                        UIHelpers.verticalSpaceTiny,
                        AppText.body(
                            "Insert the details of Employee you want to add"),
                        UIHelpers.verticalSpaceMedium,
                        AppInputField(
                          hint: 'Employee ID',
                          controller: BlocProvider.of<ViewEmployeeBloc>(context)
                              .empIdController,
                          maxLength: 7,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Employee ID is required';
                            }
                            return null;
                          },
                        ),
                        UIHelpers.verticalSpaceSmall,
                        AppInputField(
                          hint: 'Employee Name',
                          controller: BlocProvider.of<ViewEmployeeBloc>(context)
                              .nameController,
                          textInputType: TextInputType.name,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Employee Name is required';
                            }
                            return null;
                          },
                        ),
                        UIHelpers.verticalSpaceSmall,
                        AppInputField(
                            hint: 'Email Id',
                            textInputType: TextInputType.emailAddress,
                            controller:
                                BlocProvider.of<ViewEmployeeBloc>(context)
                                    .emailController,
                            validator: (value) =>
                                Validations.validateEmail(value)),
                        UIHelpers.verticalSpaceSmall,
                        AppInputField(
                          hint: 'Phone Number',
                          textInputType: TextInputType.phone,
                          maxLength: 10,
                          controller: BlocProvider.of<ViewEmployeeBloc>(context)
                              .mobileController,
                          validator: (value) =>
                              Validations.mobileValidation(value),
                        ),
                        UIHelpers.verticalSpaceSmall,
                        CustomSearchDropdown(
                          validator: (value) {
                            if (value == "" ||
                                value == "Select Role" ||
                                value == null) {
                              return 'Please Provide Role';
                            }
                            return null;
                          },
                          hintText: 'Select Role',
                          title: 'Role',
                          items: BlocProvider.of<ViewEmployeeBloc>(context)
                              .roleList,
                          selectedValue:
                              BlocProvider.of<ViewEmployeeBloc>(context).role,
                          showSearchBox: false,
                          isMenu: true,
                          onChanged: (value) {
                            BlocProvider.of<ViewEmployeeBloc>(context,
                                    listen: false)
                                .role = value;
                          },
                        ),
                        UIHelpers.verticalSpaceSmall,
                        CustomSearchDropdown(
                          title: 'Position',
                          hintText: 'Select Position',
                          validator: (value) {
                            if (value == "" ||
                                value == "Select Position" ||
                                value == null) {
                              return 'Please Provide Position';
                            }
                            return null;
                          },
                          selectedValue:
                              BlocProvider.of<ViewEmployeeBloc>(context)
                                  .position,
                          onChanged: (value) {
                            BlocProvider.of<ViewEmployeeBloc>(context,
                                    listen: false)
                                .position = value;
                          },
                          items: BlocProvider.of<ViewEmployeeBloc>(context)
                              .positionList,
                          showSearchBox: false,
                          isMenu: true,
                        ),
                        UIHelpers.verticalSpaceMedium,
                        state is InviteEmployeeLoading
                            ? CustomElevatedButton(
                                onPressed: () {},
                                backgroundColor: TTColors.primary,
                                borderColor: TTColors.primary,
                                iconColor: TTColors.primary,
                                child: LoadingAnimationWidget
                                    .horizontalRotatingDots(
                                        color: TTColors.white,
                                        size: UIHelpers.screenHeight(context) *
                                            0.1))
                            : CustomElevatedButton(
                                onPressed: () async {
                                  if (BlocProvider.of<ViewEmployeeBloc>(context)
                                          .formKey
                                          .currentState
                                          ?.validate() ==
                                      true) {
                                    BlocProvider.of<ViewEmployeeBloc>(context)
                                        .add(InviteEmployeeInitialEvent());
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    serviceLocator<AppRouter>()
                                        .popAndPush(const ViewEmployeeRoute());
                                  } else {
                                    CustomSnackBarService().showErrorSnackBar(
                                        context,
                                        message: "Please Provide all details");
                                  }
                                },
                                backgroundColor: TTColors.primary,
                                borderColor: TTColors.primary,
                                iconColor: TTColors.white,
                                child: AppText.body(
                                  'Invite Employee',
                                  color: TTColors.white,
                                )),
                        UIHelpers.verticalSpaceSmall,
                        CustomElevatedButton(
                            onPressed: () {
                              serviceLocator<AppRouter>()
                                  .replace(const ViewEmployeeRoute());
                            },
                            backgroundColor: TTColors.white,
                            borderColor: TTColors.primary,
                            iconColor: TTColors.primary,
                            child: AppText.body(
                              'Cancel',
                              color: TTColors.primary,
                            )),
                        UIHelpers.verticalSpaceSmall,
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
