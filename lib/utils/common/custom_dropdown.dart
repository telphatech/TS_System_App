import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> dropdownItems;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;

  final bool isMenu;
  final bool isEnable;

  final bool showSearchBox;
  final double? height;

  final String? Function(String?)? validator;
  final TextStyle? style;

  const CustomDropdown({
    super.key,
    required this.dropdownItems,
    this.style,
    this.selectedValue,
    this.onChanged,
    this.onSaved,
    this.height,
    this.validator,
    this.isEnable = true,
    required this.showSearchBox,
    this.isMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      enabled: isEnable,
      selectedItem: selectedValue,
      onChanged: onChanged,
      popupProps: isMenu == true
          ? PopupProps.menu(
              listViewProps: const ListViewProps(
                  dragStartBehavior: DragStartBehavior.down),
              loadingBuilder: (context, searchEntry) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, searchEntry, exception) {
                return const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Something went wrong'),
                );
              },
              emptyBuilder: (context, searchEntry) {
                return const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("No Data Found"),
                );
              },
              fit: FlexFit.loose,
              showSearchBox: showSearchBox)
          : PopupProps.dialog(
              dialogProps: const DialogProps(
                  backgroundColor: Color.fromARGB(255, 239, 240, 243),
                  elevation: 8),
              listViewProps: const ListViewProps(
                  dragStartBehavior: DragStartBehavior.down),
              loadingBuilder: (context, searchEntry) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, searchEntry, exception) {
                return const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Something went wrong'),
                );
              },
              emptyBuilder: (context, searchEntry) {
                return const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("No Data Found"),
                );
              },
              fit: FlexFit.loose,
              showSearchBox: showSearchBox),
      dropdownButtonProps: const DropdownButtonProps(color: TTColors.primary),
      items: dropdownItems,
    );
  }
}
