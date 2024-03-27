import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_bloc.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_event.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_state.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/widgets/desktop_app_bar.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ViewEmployeeDesktopView extends StatelessWidget {
  const ViewEmployeeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewEmployeeBloc()..add(ViewEmployeeInitialEvent()),
      child: PopScope(
        onPopInvoked: (didPop) {
          serviceLocator<AppRouter>().replace(const DashboardRoute());
        },
        child: Scaffold(
          drawer: const MenuDrawer(),
          appBar: const PreferredSize(
              preferredSize: Size(double.infinity, kToolbarHeight),
              child: AppBarDesktopWidget()),
          body: BlocConsumer<ViewEmployeeBloc, ViewEmployeeState>(
            listener: (context, state) {},
            builder: (context, state) {
              print("view: $state");

              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelpers.verticalSpaceRegular,
                      Row(
                        children: [
                          AppText.body("Employee List"),
                          UIHelpers.horizontalSpaceSmallRegular,
                          if (state is ViewEmployeeSuccess)
                            AppText.body(
                                "|  ${state.viewEmployeeAttributesItems.length} Employees"),
                          UIHelpers.horizontalSpaceSmallRegular,
                          const Expanded(
                            child: AppInputField(
                              color: TTColors.white,
                              hint: 'Search Employee',
                              trailing: Icon(
                                Icons.search,
                                color: TTColors.primary,
                              ),
                            ),
                          ),
                          UIHelpers.horizontalSpaceSmallRegular,
                          SizedBox(
                            width: 200,
                            child: CustomElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Theme(
                                        data: Theme.of(context).copyWith(
                                          dialogTheme: const DialogTheme(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                        ),
                                        child: BlocProvider(
                                            create: (context) => ViewEmployeeBloc()
                                              ..add(
                                                  InviteEmployeeInitialEvent()),
                                            child: BlocConsumer<
                                                ViewEmployeeBloc,
                                                ViewEmployeeState>(
                                              listener: (context, state) {},
                                              builder: (context, state) {
                                                return Dialog(
                                                  child: SingleChildScrollView(
                                                    child: Container(
                                                      width:
                                                          UIHelpers.screenWidth(
                                                                  context) /
                                                              2,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Form(
                                                        key: BlocProvider.of<
                                                                    ViewEmployeeBloc>(
                                                                context)
                                                            .formKey,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AppText.headingOne(
                                                                "Invite Employee"),
                                                            UIHelpers
                                                                .verticalSpaceTiny,
                                                            AppText.body(
                                                                "Insert the details of Employee you want to add"),
                                                            UIHelpers
                                                                .verticalSpaceMedium,
                                                            AppInputField(
                                                              hint:
                                                                  'Employee ID',
                                                              controller: BlocProvider
                                                                      .of<ViewEmployeeBloc>(
                                                                          context)
                                                                  .empIdController,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                        ?.isEmpty ==
                                                                    true) {
                                                                  return 'Employee ID is required';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                            UIHelpers
                                                                .verticalSpaceSmall,
                                                            AppInputField(
                                                              hint:
                                                                  'Employee Name',
                                                              controller: BlocProvider
                                                                      .of<ViewEmployeeBloc>(
                                                                          context)
                                                                  .nameController,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                        ?.isEmpty ==
                                                                    true) {
                                                                  return 'Employee Name is required';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                            UIHelpers
                                                                .verticalSpaceSmall,
                                                            AppInputField(
                                                                hint:
                                                                    'Email Id',
                                                                controller: BlocProvider.of<
                                                                            ViewEmployeeBloc>(
                                                                        context)
                                                                    .emailController,
                                                                validator: (value) =>
                                                                    Validations
                                                                        .validateEmail(
                                                                            value)),
                                                            UIHelpers
                                                                .verticalSpaceSmall,
                                                            AppInputField(
                                                              hint:
                                                                  'Phone Number',
                                                              controller: BlocProvider
                                                                      .of<ViewEmployeeBloc>(
                                                                          context)
                                                                  .mobileController,
                                                              validator: (value) =>
                                                                  Validations
                                                                      .mobileValidation(
                                                                          value),
                                                            ),
                                                            UIHelpers
                                                                .verticalSpaceSmall,
                                                            CustomSearchDropdown(
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        "" ||
                                                                    value ==
                                                                        "Select Role" ||
                                                                    value ==
                                                                        null) {
                                                                  return 'Please Provide Role';
                                                                }
                                                                return null;
                                                              },
                                                              hintText:
                                                                  'Select Role',
                                                              title: 'Role',
                                                              items: BlocProvider
                                                                      .of<ViewEmployeeBloc>(
                                                                          context)
                                                                  .roleList,
                                                              selectedValue:
                                                                  BlocProvider.of<
                                                                              ViewEmployeeBloc>(
                                                                          context)
                                                                      .role,
                                                              showSearchBox:
                                                                  false,
                                                              isMenu: true,
                                                              onChanged:
                                                                  (value) {
                                                                BlocProvider.of<
                                                                            ViewEmployeeBloc>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .role = value;
                                                              },
                                                            ),
                                                            UIHelpers
                                                                .verticalSpaceSmall,
                                                            CustomSearchDropdown(
                                                              title: 'Position',
                                                              hintText:
                                                                  'Select Position',
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        "" ||
                                                                    value ==
                                                                        "Select Position" ||
                                                                    value ==
                                                                        null) {
                                                                  return 'Please Provide Position';
                                                                }
                                                                return null;
                                                              },
                                                              selectedValue:
                                                                  BlocProvider.of<
                                                                              ViewEmployeeBloc>(
                                                                          context)
                                                                      .position,
                                                              onChanged:
                                                                  (value) {
                                                                BlocProvider.of<
                                                                            ViewEmployeeBloc>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .position = value;
                                                              },
                                                              items: BlocProvider
                                                                      .of<ViewEmployeeBloc>(
                                                                          context)
                                                                  .positionList,
                                                              showSearchBox:
                                                                  false,
                                                              isMenu: true,
                                                            ),
                                                            UIHelpers
                                                                .verticalSpaceMedium,
                                                            if (state
                                                                is InviteEmployeeError)
                                                              Text(
                                                                state.message,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            UIHelpers
                                                                .verticalSpaceSmall,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: state
                                                                          is InviteEmployeeLoading
                                                                      ? CustomElevatedButton(
                                                                          onPressed:
                                                                              () {},
                                                                          backgroundColor: TTColors
                                                                              .primary,
                                                                          borderColor: TTColors
                                                                              .primary,
                                                                          iconColor: TTColors
                                                                              .primary,
                                                                          child: LoadingAnimationWidget.horizontalRotatingDots(
                                                                              color: TTColors
                                                                                  .white,
                                                                              size: UIHelpers.screenHeight(context) *
                                                                                  0.1))
                                                                      : CustomElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            if (BlocProvider.of<ViewEmployeeBloc>(context).formKey.currentState?.validate() ==
                                                                                true) {
                                                                              BlocProvider.of<ViewEmployeeBloc>(context).add(InviteEmployeeInitialEvent());
                                                                              serviceLocator<AppRouter>().pop();
                                                                              BlocProvider.of<ViewEmployeeBloc>(context).add(ViewEmployeeInitialEvent());
                                                                              serviceLocator<AppRouter>().pop();
                                                                              if (state is InviteEmployeeSuccess) {
                                                                                CustomSnackBarService().showSuccessSnackBar(context, message: state.message);
                                                                              }
                                                                            } else if (state
                                                                                is InviteEmployeeError) {
                                                                              CustomSnackBarService().showErrorSnackBar(context, message: state.message);
                                                                            } else if (state
                                                                                is InviteEmployeeFailure) {
                                                                              CustomSnackBarService().showErrorSnackBar(context, message: "Something went wrong!!");
                                                                            } else {
                                                                              CustomSnackBarService().showErrorSnackBar(context, message: "Please Provide all details");
                                                                            }
                                                                          },
                                                                          backgroundColor: TTColors
                                                                              .primary,
                                                                          borderColor: TTColors
                                                                              .primary,
                                                                          iconColor: TTColors
                                                                              .white,
                                                                          child:
                                                                              const Text('Invite Employee')),
                                                                ),
                                                                UIHelpers
                                                                    .horizontalSpaceSmall,
                                                                Expanded(
                                                                  child: CustomElevatedButton(
                                                                      onPressed: () {
                                                                        serviceLocator<AppRouter>()
                                                                            .pop();
                                                                        BlocProvider.of<ViewEmployeeBloc>(context)
                                                                            .add(ViewEmployeeInitialEvent());
                                                                      },
                                                                      backgroundColor: TTColors.white,
                                                                      borderColor: TTColors.white,
                                                                      iconColor: TTColors.primary,
                                                                      child: AppText.body(
                                                                        'Cancel',
                                                                        color: TTColors
                                                                            .primary,
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )));
                                  },
                                );
                              },
                              backgroundColor: TTColors.primary,
                              borderColor: TTColors.white,
                              iconColor: TTColors.white,
                              iconData: Icons.add,
                              child: AppText.body(
                                'Invite Employee',
                                color: TTColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIHelpers.verticalSpaceRegular,
                      SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: state is ViewEmployeeSuccess
                              ? DataTable(
                                  headingRowColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      return TTColors.primary.withOpacity(0.8);
                                    },
                                  ),
                                  border: TableBorder.all(
                                      width: 1, color: TTColors.primary),
                                  columns: const <DataColumn>[
                                    DataColumn(
                                        label: Text(
                                      'Employee ID',
                                      style: TextStyle(color: TTColors.white),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Name',
                                      style: TextStyle(color: TTColors.white),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Role',
                                      style: TextStyle(color: TTColors.white),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Position',
                                      style: TextStyle(color: TTColors.white),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Email',
                                      style: TextStyle(color: TTColors.white),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Status',
                                      style: TextStyle(color: TTColors.white),
                                    )),
                                  ],
                                  rows: List<DataRow>.generate(
                                    state.viewEmployeeAttributesItems.length,
                                    (index) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(state
                                                .viewEmployeeAttributesItems[
                                                    index]
                                                ?.empEmpRefId ??
                                            "")),
                                        DataCell(Text(state
                                                .viewEmployeeAttributesItems[
                                                    index]
                                                ?.empName ??
                                            "")),
                                        DataCell(Text(state
                                                .viewEmployeeAttributesItems[
                                                    index]
                                                ?.empRole ??
                                            "")),
                                        DataCell(Text(state
                                                .viewEmployeeAttributesItems[
                                                    index]
                                                ?.empPosition ??
                                            "")),
                                        DataCell(Text(state
                                                .viewEmployeeAttributesItems[
                                                    index]
                                                ?.empEmail ??
                                            "")),
                                        DataCell(Text(state
                                                .viewEmployeeAttributesItems[
                                                    index]
                                                ?.empStatus ??
                                            "")),
                                      ],
                                    ),
                                  ),
                                )
                              : const LoadingWidget(
                                  width: double.infinity, height: 200),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
