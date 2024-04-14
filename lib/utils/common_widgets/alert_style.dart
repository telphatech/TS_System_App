import 'package:flutter/material.dart';

enum TTAlertStyle {
  success,
  info,
  warning,
  danger,
}

extension TTAlertStyleColorExtension on TTAlertStyle {
  Color textColor() {
    switch (this) {
      case TTAlertStyle.success:
        return const Color(0xFF186429);
      case TTAlertStyle.info:
        return const Color(0xFF0E616E);
      case TTAlertStyle.warning:
        return const Color(0xFF997404);
      case TTAlertStyle.danger:
        return const Color(0xFF842029);
    }
  }

  Color backgroundColor() {
    switch (this) {
      case TTAlertStyle.success:
        return const Color(0xFFD4EDDA);
      case TTAlertStyle.info:
        return const Color(0xFFD1ECF1);
      case TTAlertStyle.warning:
        return const Color(0xFFFFF3CD);
      case TTAlertStyle.danger:
        return const Color(0xFFF8D7DA);
    }
  }

  Color iconColor() {
    switch (this) {
      case TTAlertStyle.success:
        return const Color(0xFF186429);
      case TTAlertStyle.info:
        return const Color(0xFF0E616E);
      case TTAlertStyle.warning:
        return const Color(0xFF997404);
      case TTAlertStyle.danger:
        return const Color(0xFF842029);
    }
  }

  IconData iconData() {
    switch (this) {
      case TTAlertStyle.success:
        return Icons.check_circle_outline;
      case TTAlertStyle.info:
        return Icons.info;
      case TTAlertStyle.warning:
        return Icons.priority_high;
      case TTAlertStyle.danger:
        return Icons.priority_high;
    }
  }
}

class TTAlert extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Icon icon;
  final BorderRadius borderRadius;
  final Color titleColor;
  final Color messageColor;
  final double iconSpacing;
  final EdgeInsets iconPadding;
  final EdgeInsets textPadding;
  final double maxWidth;
  final TextStyle titleTextStyle;
  final TextStyle messageTextStyle;

  TTAlert(
      {super.key,
      required this.title,
      required this.message,
      required this.onTap,
      this.padding = const EdgeInsets.all(15.0),
      required this.backgroundColor,
      required this.icon,
      this.borderRadius = const BorderRadius.all(Radius.circular(6.0)),
      Color? titleColor,
      Color? messageColor,
      this.iconSpacing = 9.0,
      this.iconPadding = const EdgeInsets.only(top: 4.0),
      this.textPadding = const EdgeInsets.all(0.0),
      this.maxWidth = double.infinity,
      TextStyle? titleTextStyle,
      TextStyle? messageTextStyle})
      : titleColor = titleColor ?? Colors.grey.shade900,
        messageColor = messageColor ?? Colors.grey.shade900,
        titleTextStyle = titleTextStyle ?? const TextStyle(fontSize: 16),
        messageTextStyle = messageTextStyle ??
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w200);

  factory TTAlert.style(
      {required TTAlertStyle style,
      required String title,
      required String message,
      VoidCallback? onTap,
      double iconSize = 16.0,
      double maxWidth = double.infinity,
      TextStyle? titleTextStyle,
      TextStyle? messageTextStyle}) {
    return TTAlert(
        title: title,
        message: message,
        onTap: onTap,
        backgroundColor: style.backgroundColor(),
        icon: Icon(
          style.iconData(),
          color: style.iconColor(),
          size: iconSize,
        ),
        maxWidth: maxWidth,
        titleColor: style.textColor(),
        messageColor: style.textColor(),
        titleTextStyle: titleTextStyle,
        messageTextStyle: messageTextStyle);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: iconPadding,
              child: icon,
            ),
            SizedBox(width: iconSpacing),
            Expanded(
              child: Padding(
                padding: textPadding,
                child: RichText(
                  text: TextSpan(
                    text: "$title ",
                    style: titleTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: message,
                        style: messageTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
