import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:ts_system/modules/employee/view_employee/domain/entities/view_employee_attributes_item.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/bloc/view_employee/view_employee_bloc.dart';

class EmployeeLists extends StatelessWidget {
  const EmployeeLists({
    super.key,
    required this.gridConfiguration,
    required this.viewEmployeeAttributesItems,
  });

  final PlutoGridConfiguration gridConfiguration;
  final List<ViewEmployeeAttributesItems?> viewEmployeeAttributesItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PlutoGrid(
        columns: [
          PlutoColumn(
              readOnly: true,
              frozen: PlutoColumnFrozen.start,
              title: "Employee ID",
              field: "empUID",
              type: PlutoColumnType.text(),
              enableSorting: true),
          PlutoColumn(
              title: "Employee Name",
              field: "empName",
              type: PlutoColumnType.text(),
              enableSorting: true),
          PlutoColumn(
              title: "Email ID",
              field: "emailId",
              type: PlutoColumnType.text(),
              enableSorting: true),
          PlutoColumn(
              title: "Role",
              field: "role",
              type: PlutoColumnType.text(),
              enableSorting: true),
          PlutoColumn(
              title: "Position",
              field: "position",
              type: PlutoColumnType.text(),
              enableSorting: true),
          PlutoColumn(
              title: "Status",
              field: "status",
              type: PlutoColumnType.select(
                  BlocProvider.of<ViewEmployeeBloc>(context).statusList),
              enableSorting: true),
        ],
        rows: viewEmployeeAttributesItems.map((item) {
          return PlutoRow(cells: {
            "empUID": PlutoCell(value: item?.empEmpRefId ?? ""),
            "empName": PlutoCell(value: item?.empName ?? ""),
            "emailId": PlutoCell(value: item?.empEmail ?? ""),
            "role": PlutoCell(value: item?.empRole ?? ""),
            "position": PlutoCell(value: item?.empPosition ?? ""),
            "status": PlutoCell(value: item?.empStatus ?? ""),
          });
        }).toList(),
        mode: PlutoGridMode.readOnly,
        configuration: gridConfiguration,
      ),
    );
  }
}
