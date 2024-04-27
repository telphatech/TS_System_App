import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:ts_system/modules/configuration_system/presentation/bloc/view_leave/view_leave_bloc.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common_widgets/empty_widget.dart';
import 'package:ts_system/utils/common_widgets/failure_widget.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ViewLeaveReport extends StatelessWidget {
  const ViewLeaveReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewLeaveBloc()..add(ViewLeaveInitialEvent()),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelpers.verticalSpaceSmall,
            BlocBuilder<ViewLeaveBloc, ViewLeaveState>(
              builder: (context, state) {
                if (state is ViewLeaveFailure) {
                  return FailureWidget(onTap: () {
                    BlocProvider.of<ViewLeaveBloc>(context)
                        .add(ViewLeaveInitialEvent());
                  });
                } else if (state is ViewLeaveEmpty) {
                  return emptyWidget();
                } else if (state is ViewLeaveLoading) {
                  return LoadingWidget(
                      width: UIHelpers.screenWidth(context),
                      height: UIHelpers.screenHeight(context) * 0.8);
                } else if (state is ViewLeaveSuccess) {
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
                          title: '',
                          field: 'action',
                          type: PlutoColumnType.text(),
                          width: 80,
                          renderer: (rendererContext) {
                            final rowData = rendererContext.row.cells.values
                                .map((cell) => cell.value.toString())
                                .toList();

                            return IconButton(
                                hoverColor: TTColors.transparent,
                                onPressed: () {
                                  openRightSideModal(context, rowData);
                                },
                                icon: const Icon(Icons.arrow_right));
                          },
                        ),
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
                          title: 'Leave Type',
                          field: 'leaveType',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Leave From',
                          field: 'leaveFrom',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Leave To',
                          field: 'leaveTo',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Reason',
                          field: 'reason',
                          type: PlutoColumnType.text(),
                        ),
                        PlutoColumn(
                          backgroundColor: TTColors.primary,
                          title: 'Status',
                          field: 'status',
                          type: PlutoColumnType.select(
                              ['pending', 'approved', 'rejected'],
                              defaultValue: 'pending'),
                        ),
                      ],
                      rows: state.viewLeaveReportList.reversed
                          .map((e) => PlutoRow(
                                cells: {
                                  'action': PlutoCell(value: e?.leaveId ?? ""),
                                  'id': PlutoCell(value: e?.leaveEmpId ?? ""),
                                  'name': PlutoCell(value: e?.empName ?? ""),
                                  'leaveType':
                                      PlutoCell(value: e?.leaveType ?? ""),
                                  'leaveFrom': PlutoCell(
                                      value: DateFormat('dd MMM yyyy').format(
                                          e?.leaveFrom ?? DateTime.now())),
                                  'leaveTo': PlutoCell(
                                      value: DateFormat('dd MMM yyyy').format(
                                          e?.leaveTo ?? DateTime.now())),
                                  'reason':
                                      PlutoCell(value: e?.leaveReason ?? ""),
                                  'status':
                                      PlutoCell(value: e?.leaveStatus ?? ""),
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
                            label: 'Leave Type',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[3].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Leave From',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[4].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Leave To',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[5].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Reason',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[6].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                          AppInputField(
                            label: 'Status',
                            readOnly: true,
                            controller: TextEditingController(
                                text: rowData[7].toString()),
                          ),
                          UIHelpers.verticalSpaceSmall,
                        ],
                      ))),
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
