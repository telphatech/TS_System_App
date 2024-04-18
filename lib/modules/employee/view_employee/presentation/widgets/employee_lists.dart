import 'package:flutter/material.dart';
import 'package:ts_system/modules/employee/view_employee/domain/entities/view_employee_attributes_item.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class EmployeeLists extends StatelessWidget {
  const EmployeeLists({
    super.key,
    required this.viewEmployeeAttributesItems,
  });

  final List<ViewEmployeeAttributesItems?> viewEmployeeAttributesItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return UIHelpers.verticalSpaceSmall;
            },
            itemCount: viewEmployeeAttributesItems.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: TTColors.primary)),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
                  leading: Text("${index + 1}"),
                  subtitle: Text(
                      "Role: ${viewEmployeeAttributesItems[index]?.empRole ?? ""}"),
                  trailing: Text(
                      viewEmployeeAttributesItems[index]?.empEmpRefId ?? ""),
                  title:
                      Text(viewEmployeeAttributesItems[index]?.empName ?? ""),
                ),
              );
            })));
  }
}
