import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/entities/fetch_leave_attributes.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/bloc/bloc/leave_bloc.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/application_list.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/holiday_widgets.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_appbar.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_type_container_widget.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common_widgets/failure_widget.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class LeaveDashboardMobileView extends StatelessWidget {
  const LeaveDashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedPreferenceService = serviceLocator<SharedPreferenceService>();
    return BlocProvider(
      create: (context) => LeaveBloc(),
      child: BlocConsumer<LeaveBloc, LeaveState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            drawer: const MenuDrawer(),
            appBar: const PreferredSize(
                preferredSize: Size(double.infinity, kToolbarHeight),
                child: LeaveAppBar()),
            body: Column(
              children: [
                UIHelpers.verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: AppText.body5("Balance Leaves")),
                    ],
                  ),
                ),
                UIHelpers.verticalSpaceRegular,
                Container(
                  height: 170,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 05,
                  ),
                  width: UIHelpers.screenWidth(context),
                  child: BlocProvider(
                    create: (context) => LeaveBloc()
                      ..add(LeaveFetchCountEvent(
                          memberId: sharedPreferenceService.empID)),
                    child: BlocBuilder<LeaveBloc, LeaveState>(
                      builder: (context, state) {
                        if (state is LeaveFetchCountSuccess) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final fetchCount =
                                  state.fetchCountAttributesItems[index];
                              return LeaveTypeContainerWidget(
                                leaveType: fetchCount?.leaveType ?? "",
                                available: fetchCount?.available ?? 0,
                                total: fetchCount?.total ?? 0,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                UIHelpers.horizontalSpaceSmall,
                            itemCount: state.fetchCountAttributesItems.length,
                          );
                        } else if (state is LeaveFetchCountLoading) {
                          return const LoadingWidget(
                              width: double.infinity, height: 50);
                        } else if (state is LeaveFetchCountFailure) {
                          return FailureWidget(onTap: () {
                            BlocProvider.of<LeaveBloc>(context).add(
                                LeaveFetchCountEvent(
                                    memberId: sharedPreferenceService.empID));
                          });
                        } else {
                          return const Center(
                            child: Text(AppUtils.somethingWentWrong),
                          );
                        }
                      },
                    ),
                  ),
                ),
                UIHelpers.verticalSpaceRegular,
                Flexible(
                  flex: 2,
                  child: DefaultTabController(
                    length: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TabBar(
                                  indicatorColor: TTColors.primary,
                                  unselectedLabelColor: TTColors.grey,
                                  labelStyle: TTypography.normal.copyWith(
                                    fontSize:
                                        UIHelpers.screenWidth(context) * 0.04,
                                    fontWeight: FontWeight.w400,
                                    color: TTColors.primary,
                                  ),
                                  unselectedLabelStyle:
                                      TTypography.normal.copyWith(
                                    fontSize:
                                        UIHelpers.screenWidth(context) * 0.04,
                                    fontWeight: FontWeight.w400,
                                    color: TTColors.grey,
                                  ),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  dragStartBehavior: DragStartBehavior.start,
                                  isScrollable: true,
                                  tabAlignment: TabAlignment.start,
                                  tabs: [
                                    const Tab(text: 'Leaves'),
                                    if (sharedPreferenceService.role == "admin")
                                      const Tab(text: 'Requests'),
                                    const Tab(text: 'Holidays'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          UIHelpers.verticalSpaceRegular,
                          Flexible(
                            child: TabBarView(
                              children: [
                                BlocProvider(
                                  create: (context) => LeaveBloc()
                                    ..add(LeaveFetchLeavesEvent(
                                        memberId:
                                            sharedPreferenceService.empID)),
                                  child: RefreshIndicator(
                                    onRefresh: () async {
                                      BlocProvider.of<LeaveBloc>(context).add(
                                        LeaveFetchLeavesEvent(
                                          memberId:
                                              sharedPreferenceService.empID,
                                        ),
                                      );
                                    },
                                    child: BlocBuilder<LeaveBloc, LeaveState>(
                                      builder: (context, state) {
                                        if (state is LeaveFetchLeavesSuccess) {
                                          return ListView.separated(
                                            itemBuilder: (context, index) {
                                              final reversed = state
                                                  .fetchLeavesAttributesItems
                                                  .reversed
                                                  .toList();
                                              return ApplicationListWidget(
                                                fetchLeavesAttributesItems:
                                                    reversed[index],
                                              );
                                            },
                                            separatorBuilder: (context,
                                                    index) =>
                                                UIHelpers.verticalSpaceRegular,
                                            itemCount: state
                                                .fetchLeavesAttributesItems
                                                .length,
                                          );
                                        } else if (state
                                            is LeaveFetchLeavesLoading) {
                                          return const LoadingWidget(
                                              width: double.infinity,
                                              height: 200);
                                        } else if (state
                                            is LeaveFetchLeavesFailure) {
                                          return FailureWidget(onTap: () {
                                            BlocProvider.of<LeaveBloc>(context)
                                                .add(
                                              LeaveFetchLeavesEvent(
                                                memberId:
                                                    sharedPreferenceService
                                                        .empID,
                                              ),
                                            );
                                          });
                                        } else {
                                          return const Center(
                                            child: Text(
                                                AppUtils.somethingWentWrong),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                if (sharedPreferenceService.role == "admin")
                                  ListView.separated(
                                    itemBuilder: (context, index) {
                                      return const ApplicationListWidget(
                                        fetchLeavesAttributesItems:
                                            FetchLeaveAttributesItems(),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        UIHelpers.verticalSpaceRegular,
                                    itemCount: 5,
                                  ),
                                const HolidayWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: TTColors.primary,
              onPressed: () {
                serviceLocator<AppRouter>().push(const ApplyLeaveMobileView());
              },
              child: const Icon(
                Icons.add,
                color: TTColors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
