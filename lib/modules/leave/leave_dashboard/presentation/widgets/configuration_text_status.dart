import 'package:flutter/material.dart';

Color? getStatusColor(String status) {
  if (status == "Approved") {
    return const Color.fromRGBO(226, 242, 225, 1);
  } else if (status == "Pending" || status == "Applied") {
    return const Color.fromRGBO(237, 240, 204, 1);
  }

  return const Color.fromRGBO(249, 224, 224, 1);
}

Color? getTextStatusColor(String status) {
  if (status == "Approved") {
    return const Color.fromRGBO(82, 196, 26, 1);
  } else if (status == "Pending") {
    return const Color.fromRGBO(125, 131, 148, 1);
  } else if (status == "Rejected") {
    return const Color.fromRGBO(255, 77, 79, 1);
  }
  return const Color.fromRGBO(125, 131, 148, 1);
}
