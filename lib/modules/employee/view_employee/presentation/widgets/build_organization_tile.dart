import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

Widget buildOrganizationTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required void Function() onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: TTColors.black),
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      isThreeLine: true,
      leading: const Icon(Icons.business_rounded),
      trailing: const Icon(Icons.arrow_forward_rounded),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      onTap: onTap,
    ),
  );
}
