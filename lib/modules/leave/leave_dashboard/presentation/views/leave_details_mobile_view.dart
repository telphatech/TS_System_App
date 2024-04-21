import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/bloc/bloc/leave_bloc.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common_widgets/failure_widget.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class LeaveDetailsMobileView extends StatefulWidget {
  final String? uId;
  final bool? isRequest;

  const LeaveDetailsMobileView(
      {super.key, required this.uId, required this.isRequest});

  @override
  State<LeaveDetailsMobileView> createState() => _LeaveDetailsMobileViewState();
}

class _LeaveDetailsMobileViewState extends State<LeaveDetailsMobileView> {
  String? status;
  bool statusValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TTColors.primary,
        leading: IconButton(
            onPressed: () {
              serviceLocator<AppRouter>().replace(const LeaveDashboard());
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: TTColors.white,
            )),
        title: Text(
          AppUtils.leaveDetail,
          style: TTypography.normal.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: TTColors.white,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            LeaveBloc()..add(LeaveFetchLeaveDetailsEvent(leaveId: widget.uId)),
        child: BlocConsumer<LeaveBloc, LeaveState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LeaveFetchLeaveDetailsSuccess) {
              status =
                  state.fetchLeavesByMemberIdAttributesItems?.leaveStatus ??
                      "Applied";
              return SingleChildScrollView(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  children: [
                    AppInputField(
                      label: 'Employee Id',
                      readOnly: true,
                      controller: TextEditingController(
                          text: state.fetchLeavesByMemberIdAttributesItems
                                  ?.empId ??
                              ""),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    AppInputField(
                      label: 'Leave Type',
                      readOnly: true,
                      controller: TextEditingController(
                          text: state.fetchLeavesByMemberIdAttributesItems
                                  ?.leaveType ??
                              ""),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    AppInputField(
                      label: 'Leave From',
                      readOnly: true,
                      controller: TextEditingController(
                          text: DateFormat('dd MMM yyyy').format(state
                                  .fetchLeavesByMemberIdAttributesItems
                                  ?.leaveFrom ??
                              DateTime.now())),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    AppInputField(
                      label: 'Leave To',
                      readOnly: true,
                      controller: TextEditingController(
                          text: DateFormat('dd MMM yyyy').format(state
                                  .fetchLeavesByMemberIdAttributesItems
                                  ?.leaveTo ??
                              DateTime.now())),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    AppInputField(
                      label: 'Reason',
                      maxLines: 5,
                      readOnly: true,
                      controller: TextEditingController(
                          text: state.fetchLeavesByMemberIdAttributesItems
                                  ?.leaveReason ??
                              ""),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    CustomSearchDropdown(
                        selectedValue: status,
                        isMenu: true,
                        isEnable:
                            serviceLocator<SharedPreferenceService>().role ==
                                    "admin" &&
                                widget.isRequest == true &&
                                state.fetchLeavesByMemberIdAttributesItems
                                        ?.leaveStatus ==
                                    "Applied",
                        items: const ["Applied", "Approved", "Rejected"],
                        onChanged: (value) {
                          setState(() {
                            status = value;
                            statusValue = true;
                          });
                        },
                        showSearchBox: false),
                    UIHelpers.verticalSpaceSmall,
                    statusValue == true
                        ? CustomElevatedButton(
                            onPressed: () {},
                            backgroundColor: TTColors.primary,
                            borderColor: TTColors.primary,
                            iconColor: TTColors.white,
                            child: const Text(
                              'Update Status',
                              style: TextStyle(color: TTColors.white),
                            ))
                        : UIHelpers.verticalSpaceTiny,
                  ],
                ),
              );
            } else if (state is LeaveFetchLeaveDetailsFailure) {
              return FailureWidget(onTap: () {
                BlocProvider.of<LeaveBloc>(context)
                    .add(LeaveFetchLeaveDetailsEvent(leaveId: widget.uId));
              });
            } else if (state is LeaveFetchLeaveDetailsLoading) {
              return const Padding(
                padding: EdgeInsets.all(10.0),
                child: LoadingWidget(width: double.infinity, height: 200),
              );
            }
            return const LoadingWidget(width: double.infinity, height: 200);
          },
        ),
      ),
    );
  }
}
