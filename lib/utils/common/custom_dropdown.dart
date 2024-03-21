import "package:dropdown_search/dropdown_search.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:ts_system/utils/components/tt_colors.dart";

class CustomSearchDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;

  final bool? isMenu;

  final bool? isEnable;
  final bool showSearchBox;
  final String? emptyText;
  final String? title;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;

  const CustomSearchDropdown({
    super.key,
    required this.items,
    this.title,
    this.style,
    this.selectedValue,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.isEnable = true,
    this.emptyText,
    this.hintText,
    this.hintStyle,
    required this.showSearchBox,
    this.isMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null || title == '')
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title ?? '',
              style: const TextStyle(fontSize: 14, color: TTColors.textPrimary),
            ),
          ),
        DropdownSearch<String>(
          validator: validator,
          enabled: isEnable ?? true,
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
                        child: Text("something went wrong"));
                  },
                  emptyBuilder: (context, searchEntry) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(emptyText ?? "No Data Found"),
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
                        child: Text("something went wrong"));
                  },
                  emptyBuilder: (context, searchEntry) {
                    return const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("No Data Found"),
                    );
                  },
                  fit: FlexFit.loose,
                  showSearchBox: showSearchBox),
          dropdownButtonProps: const DropdownButtonProps(),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
              hintText: hintText ?? "select ",
              hintStyle: const TextStyle(color: TTColors.grey),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: TTColors.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1)),
            ),
          ),
          items: items,
        ),
      ],
    );
  }
}
