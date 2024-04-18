import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_bloc.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_event.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_state.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/widgets/employee_lists.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common_widgets/empty_widget.dart';
import 'package:ts_system/utils/common_widgets/failure_widget.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ViewEmployeeMobileView extends StatelessWidget {
  const ViewEmployeeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewEmployeeBloc()..add(ViewEmployeeInitialEvent()),
      child: Scaffold(
        drawer: const MenuDrawer(),
        appBar: AppBar(
          backgroundColor: TTColors.primary,
          iconTheme: const IconThemeData(color: TTColors.white),
          title: const Text(
            'EMPLOYEE',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ViewEmployeeBloc, ViewEmployeeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ViewEmployeeSuccess) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomElevatedButton(
                        onPressed: () {
                          serviceLocator<AppRouter>()
                              .push(const AddEmployeeMobileView());
                        },
                        backgroundColor: TTColors.primary,
                        borderColor: TTColors.primary,
                        iconColor: TTColors.white,
                        iconData: Icons.add,
                        child: AppText.body(
                          'Invite Employee',
                          color: TTColors.white,
                        ),
                      ),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.headingTwo("Employees"),
                        AppText.headingTwo(
                            "Total Result: ${state.viewEmployeeAttributesItems.length}"),
                      ],
                    ),
                    UIHelpers.verticalSpaceRegular,
                    EmployeeLists(
                      viewEmployeeAttributesItems:
                          state.viewEmployeeAttributesItems,
                    ),
                  ],
                ),
              );
            } else if (state is ViewEmployeeEmpty) {
              return emptyWidget();
            } else if (state is ViewEmployeeFailure) {
              return FailureWidget(onTap: () {
                BlocProvider.of<ViewEmployeeBloc>(context)
                    .add(ViewEmployeeInitialEvent());
              });
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: LoadingWidget(
                  width: double.infinity,
                  height: UIHelpers.screenHeight(context),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
