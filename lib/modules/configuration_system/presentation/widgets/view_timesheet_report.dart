import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:ts_system/modules/configuration_system/presentation/bloc/bloc/view_timesheet_bloc.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common_widgets/empty_widget.dart';
import 'package:ts_system/utils/common_widgets/failure_widget.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ViewTimesheetReport extends StatelessWidget {
  const ViewTimesheetReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ViewTimesheetBloc()..add(ViewTimesheetReportInitialEvent()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ViewTimesheetBloc, ViewTimesheetState>(
              builder: (context, state) {
                if (state is ViewTimesheetFailure) {
                  return FailureWidget(onTap: () {
                    BlocProvider.of<ViewTimesheetBloc>(context)
                        .add(ViewTimesheetReportInitialEvent());
                  });
                } else if (state is ViewTimesheetEmpty) {
                  return emptyWidget();
                } else if (state is ViewTimesheetLoading) {
                  return LoadingWidget(
                      width: UIHelpers.screenWidth(context),
                      height: UIHelpers.screenHeight(context) * 0.8);
                } else if (state is ViewTimesheetSuccess) {
                  return SizedBox(
                    width: UIHelpers.screenWidth(context),
                    height: UIHelpers.screenHeight(context) * 0.8,
                    child: PlutoGrid(
                      mode: PlutoGridMode.readOnly,
                      configuration: const PlutoGridConfiguration(),
                      columns: [
                        PlutoColumn(
                          title: '',
                          field: 'action',
                          type: PlutoColumnType.text(),
                          width: 70,
                          renderer: (rendererContext) {
                            final rowData = rendererContext.row.cells.values
                                .map((cell) => cell.value.toString())
                                .toList();

                            return IconButton(
                                onPressed: () {
                                  openRightSideModal(context, rowData);
                                },
                                icon: const Icon(Icons.arrow_right));
                          },
                        ),
                        PlutoColumn(
                          title: 'Employee Id',
                          field: 'id',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          title: 'Employee Name',
                          field: 'name',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          title: 'Date',
                          field: 'date',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          title: 'Group Name',
                          field: 'group',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          title: 'Task Name',
                          field: 'task',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          title: 'Task Description',
                          field: 'desc',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          title: 'Start Time',
                          field: 'start',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          title: 'End Time',
                          field: 'end',
                          type: PlutoColumnType.text(),
                        ),
                      ],
                      rows: state.viewTimesheetReport.reversed
                          .map((e) => PlutoRow(
                                cells: {
                                  'action': PlutoCell(value: e?.tmshId ?? ""),
                                  'id': PlutoCell(value: e?.tmshMemberId ?? ""),
                                  'name': PlutoCell(value: e?.tmshId ?? ""),
                                  'date': PlutoCell(
                                      value: DateFormat('dd MMM yyyy').format(
                                          e?.tmshDate ?? DateTime.now())),
                                  'group':
                                      PlutoCell(value: e?.tmshGroupId ?? ""),
                                  'task': PlutoCell(value: e?.tmshTitle ?? ""),
                                  'desc': PlutoCell(
                                      value: e?.tmshDescription ?? ""),
                                  'start': PlutoCell(
                                      value: DateFormat('hh:mm a').format(
                                          e?.tmshStartTime ?? DateTime.now())),
                                  'end': PlutoCell(
                                      value: DateFormat('hh:mm a').format(
                                          e?.tmshEndTime ?? DateTime.now())),
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

void openRightSideModal(BuildContext context, List<String> rowData) {
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
              width: UIHelpers.screenWidth(context) * 0.28,
              height: UIHelpers.screenHeight(context),
              child: Scaffold(
                  appBar: AppBar(
                    title: Text(rowData[1].toString()),
                    centerTitle: true,
                  ),
                  body: SingleChildScrollView(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Employee Name',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[2].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Date',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[3].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Group Name',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[4].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Task Name',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[5].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Description',
                            maxLines: 3,
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[6].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Start Time',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[7].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'End Time',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[8].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                        ],
                      ))), // Replace with your content
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
