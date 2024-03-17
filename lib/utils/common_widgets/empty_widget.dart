import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_icons.dart';

Padding emptyWidget() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Image.network(TTIcons.noData, width: double.infinity, height: 500),
  );
}
