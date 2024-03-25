import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_bloc.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_event.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_state.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/widgets/desktop_app_bar.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ViewEmployeeDesktopView extends StatelessWidget {
  const ViewEmployeeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewEmployeeBloc()..add(ViewEmployeeInitialEvent()),
      child: Scaffold(
        drawer: const MenuDrawer(),
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: AppBarDesktopWidget()),
        body: BlocConsumer<ViewEmployeeBloc, ViewEmployeeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ViewEmployeeSuccess) {
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
                                serviceLocator<AppRouter>()
                                    .push(const AddEmployeeMobileView());
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
                        child: DataTable(
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
                                        .viewEmployeeAttributesItems[index]
                                        ?.empEmpRefId ??
                                    "")),
                                DataCell(Text(state
                                        .viewEmployeeAttributesItems[index]
                                        ?.empName ??
                                    "")),
                                DataCell(Text(state
                                        .viewEmployeeAttributesItems[index]
                                        ?.empRole ??
                                    "")),
                                DataCell(Text(state
                                        .viewEmployeeAttributesItems[index]
                                        ?.empPosition ??
                                    "")),
                                DataCell(Text(state
                                        .viewEmployeeAttributesItems[index]
                                        ?.empEmail ??
                                    "")),
                                DataCell(Text(state
                                        .viewEmployeeAttributesItems[index]
                                        ?.empStatus ??
                                    "")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(10.0),
                child: LoadingWidget(
                  width: double.infinity,
                  height: 500,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
