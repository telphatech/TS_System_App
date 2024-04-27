import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_bloc.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_event.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_state.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/common_widgets/empty_widget.dart';
import 'package:ts_system/utils/common_widgets/failure_widget.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ViewEmployeeReport extends StatelessWidget {
  const ViewEmployeeReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewEmployeeBloc()..add(ViewEmployeeInitialEvent()),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelpers.verticalSpaceSmall,
            SizedBox(
              width: UIHelpers.screenWidth(context) * 0.2,
              child: CustomElevatedButton(
                  onPressed: () {
                    openRightSideModal(context);
                  },
                  backgroundColor: TTColors.primary,
                  borderColor: TTColors.primary,
                  child: Text("Invite Employee"),
                  iconColor: TTColors.white),
            ),
            UIHelpers.verticalSpaceSmall,
            BlocBuilder<ViewEmployeeBloc, ViewEmployeeState>(
              builder: (context, state) {
                if (state is ViewEmployeeFailure) {
                  return FailureWidget(onTap: () {
                    BlocProvider.of<ViewEmployeeBloc>(context)
                        .add(ViewEmployeeInitialEvent());
                  });
                } else if (state is ViewEmployeeEmpty) {
                  return emptyWidget();
                } else if (state is ViewEmployeeLoading) {
                  return LoadingWidget(
                      width: UIHelpers.screenWidth(context),
                      height: UIHelpers.screenHeight(context) * 0.8);
                } else if (state is ViewEmployeeSuccess) {
                  return SizedBox(
                    width: UIHelpers.screenWidth(context),
                    height: UIHelpers.screenHeight(context) * 0.8,
                    child: PlutoGrid(
                      mode: PlutoGridMode.readOnly,
                      configuration: PlutoGridConfiguration(
                          style: PlutoGridStyleConfig(
                        borderColor: TTColors.grey,
                        rowHeight: 50,
                        iconColor: Colors.white,
                        columnTextStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, color: TTColors.white),
                      )),
                      columns: [
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Employee Id',
                          field: 'id',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Employee Name',
                          field: 'name',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Email Id',
                          field: 'email',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Role',
                          field: 'role',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Position',
                          field: 'position',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Status',
                          field: 'status',
                          type: PlutoColumnType.text(),
                        ),
                      ],
                      rows: state.viewEmployeeAttributesItems.reversed
                          .map((e) => PlutoRow(
                                cells: {
                                  'id': PlutoCell(value: e?.empEmpRefId ?? ""),
                                  'name': PlutoCell(value: e?.empName ?? ""),
                                  'email': PlutoCell(value: e?.empEmail ?? ""),
                                  'role': PlutoCell(value: e?.empRole ?? ""),
                                  'position':
                                      PlutoCell(value: e?.empPosition ?? ""),
                                  'status':
                                      PlutoCell(value: e?.empStatus ?? ""),
                                },
                              ))
                          .toList(),
                    ),
                  );
                } else {
                  return emptyWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

void openRightSideModal(BuildContext context) {
  Navigator.push(
    context,
    TransparentRoute(
      child: Stack(
        children: [
          // Background with reduced opacity
          GestureDetector(
            onTap: () => Navigator.pop(context), // Dismiss on tap
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          // Side modal content with half width
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: UIHelpers.screenWidth(context) * 0.30,
              height: UIHelpers.screenHeight(context),
              child: Scaffold(
                  appBar: AppBar(
                    title: const Text("Invite Employee"),
                    centerTitle: true,
                  ),
                  body: BlocProvider(
                    create: (context) => ViewEmployeeBloc(),
                    child: BlocBuilder<ViewEmployeeBloc, ViewEmployeeState>(
                      builder: (context, state) {
                        return SingleChildScrollView(
                          child: Container(
                            width: UIHelpers.screenWidth(context) / 2,
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: BlocProvider.of<ViewEmployeeBloc>(context)
                                  .formKey,
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
                                    controller:
                                        BlocProvider.of<ViewEmployeeBloc>(
                                                context)
                                            .empIdController,
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
                                    controller:
                                        BlocProvider.of<ViewEmployeeBloc>(
                                                context)
                                            .nameController,
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
                                      controller:
                                          BlocProvider.of<ViewEmployeeBloc>(
                                                  context)
                                              .emailController,
                                      validator: (value) =>
                                          Validations.validateEmail(value)),
                                  UIHelpers.verticalSpaceSmall,
                                  AppInputField(
                                    hint: 'Phone Number',
                                    maxLength: 10,
                                    controller:
                                        BlocProvider.of<ViewEmployeeBloc>(
                                                context)
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
                                    items: BlocProvider.of<ViewEmployeeBloc>(
                                            context)
                                        .roleList,
                                    selectedValue:
                                        BlocProvider.of<ViewEmployeeBloc>(
                                                context)
                                            .role,
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
                                        BlocProvider.of<ViewEmployeeBloc>(
                                                context)
                                            .position,
                                    onChanged: (value) {
                                      BlocProvider.of<ViewEmployeeBloc>(context,
                                              listen: false)
                                          .position = value;
                                    },
                                    items: BlocProvider.of<ViewEmployeeBloc>(
                                            context)
                                        .positionList,
                                    showSearchBox: false,
                                    isMenu: true,
                                  ),
                                  UIHelpers.verticalSpaceSmall,
                                  CustomSearchDropdown(
                                    title: 'Reporting Manager',
                                    hintText: 'Select Reporting Manager',
                                    validator: (value) {
                                      if (value == "" ||
                                          value == "Select Reporting Manager" ||
                                          value == null) {
                                        return 'Please Provide Reporting Manager';
                                      }
                                      return null;
                                    },
                                    selectedValue:
                                        BlocProvider.of<ViewEmployeeBloc>(
                                                context)
                                            .reportingManager,
                                    onChanged: (value) {
                                      BlocProvider.of<ViewEmployeeBloc>(context,
                                              listen: false)
                                          .position = value;
                                    },
                                    items: BlocProvider.of<ViewEmployeeBloc>(
                                            context)
                                        .positionList,
                                    showSearchBox: false,
                                    isMenu: true,
                                  ),
                                  UIHelpers.verticalSpaceSmall,
                                  if (state is InviteEmployeeError)
                                    Text(
                                      state.message,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  UIHelpers.verticalSpaceSmall,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: state is InviteEmployeeLoading
                                            ? CustomElevatedButton(
                                                onPressed: () {},
                                                backgroundColor:
                                                    TTColors.primary,
                                                borderColor: TTColors.primary,
                                                iconColor: TTColors.primary,
                                                child: LoadingAnimationWidget
                                                    .horizontalRotatingDots(
                                                        color: TTColors.white,
                                                        size: UIHelpers
                                                                .screenHeight(
                                                                    context) *
                                                            0.1))
                                            : CustomElevatedButton(
                                                onPressed: () {
                                                  if (BlocProvider.of<
                                                                  ViewEmployeeBloc>(
                                                              context)
                                                          .formKey
                                                          .currentState
                                                          ?.validate() ==
                                                      true) {
                                                    BlocProvider.of<
                                                                ViewEmployeeBloc>(
                                                            context)
                                                        .add(
                                                            InviteEmployeeInitialEvent());
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                backgroundColor:
                                                    TTColors.primary,
                                                borderColor: TTColors.primary,
                                                iconColor: TTColors.white,
                                                child: const Text(
                                                    'Invite Employee')),
                                      ),
                                      UIHelpers.horizontalSpaceSmall,
                                      Expanded(
                                        child: CustomElevatedButton(
                                            onPressed: () {
                                              serviceLocator<AppRouter>().pop();
                                              BlocProvider.of<ViewEmployeeBloc>(
                                                      context)
                                                  .add(
                                                      ViewEmployeeInitialEvent());
                                            },
                                            backgroundColor: TTColors.white,
                                            borderColor: TTColors.primary,
                                            iconColor: TTColors.primary,
                                            child: AppText.body(
                                              'Cancel',
                                              color: TTColors.primary,
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
                    ),
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}

class TransparentRoute extends PopupRoute {
  final Widget child;

  TransparentRoute({required this.child});

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => 'Modal';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
