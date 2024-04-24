import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/bloc/bloc/leave_bloc.dart';
import 'package:ts_system/utils/common_widgets/empty_widget.dart';
import 'package:ts_system/utils/common_widgets/failure_widget.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class HolidayWidget extends StatelessWidget {
  const HolidayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaveBloc()..add(HolidaysEvent()),
      child: BlocBuilder<LeaveBloc, LeaveState>(
        builder: (context, state) {
          if (state is HolidaysEmpty) {
            return emptyWidget();
          } else if (state is HolidaysFailure) {
            return FailureWidget(onTap: () {
              BlocProvider.of<LeaveBloc>(context).add(HolidaysEvent());
            });
          } else if (state is HolidaysLoading) {
            return const LoadingWidget(width: double.infinity, height: 200);
          } else if (state is HolidaysSuccess) {
            return Column(
              children: [
                Container(
                  color: TTColors.grey,
                  padding: const EdgeInsets.all(08.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Occasion",
                          style: TTypography.normal.copyWith(
                            fontWeight: FontWeight.bold,
                            color: TTColors.white,
                          ),
                        ),
                      ),
                      UIHelpers.horizontalSpaceSmall,
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Date",
                          style: TTypography.normal.copyWith(
                            fontWeight: FontWeight.bold,
                            color: TTColors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Day",
                          style: TTypography.normal.copyWith(
                            fontWeight: FontWeight.bold,
                            color: TTColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final holiday = state.holidaysAttributesItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                holiday?.holidayOccasion ?? "",
                                style: TTypography.normal.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: TTColors.black,
                                ),
                              ),
                            ),
                            UIHelpers.horizontalSpaceSmall,
                            Expanded(
                              flex: 2,
                              child: Text(
                                DateFormat('dd MMM yyyy').format(
                                    holiday?.holidayDate ?? DateTime.now()),
                                style: TTypography.normal.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: TTColors.black,
                                ),
                              ),
                            ),
                            UIHelpers.verticalSpaceSmall,
                            Expanded(
                              child: Text(
                                DateFormat('EEEE').format(
                                    holiday?.holidayDate ?? DateTime.now()),
                                style: TTypography.normal.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: TTColors.black,
                                ),
                              ),
                            ),
                            UIHelpers.verticalSpaceSmall,
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        UIHelpers.verticalSpaceRegular,
                    itemCount: state.holidaysAttributesItems.length,
                  ),
                ),
              ],
            );
          } else {
            return const LoadingWidget(width: double.infinity, height: 200);
          }
        },
      ),
    );
  }
}
