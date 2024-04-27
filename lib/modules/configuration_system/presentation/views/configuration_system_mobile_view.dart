import 'package:flutter/material.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';

class ConfigurationSystemMobileView extends StatelessWidget {
  const ConfigurationSystemMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MenuDrawer(),
    );
  }
}
