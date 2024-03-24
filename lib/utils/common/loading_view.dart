import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';
import 'package:ts_system/utils/common_widgets/custom_progress.dart';

class LoadingView extends StatefulWidget {
  final String? text;

  final Color? backColor;

  final Color? progressColor;

  const LoadingView({super.key, this.text, this.backColor, this.progressColor});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: widget.backColor ?? TTColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
              height:
                  UIHelpers.screenHeightPercentage(context, percentage: 0.25),
              child: const CustomProgress()),
        ],
      ),
    );
  }
}
