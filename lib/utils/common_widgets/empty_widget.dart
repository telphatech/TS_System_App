import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

Padding emptyWidget() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: CachedNetworkImage(
        imageUrl: TTIcons.noData, width: double.infinity, height: 300),
  );
}
