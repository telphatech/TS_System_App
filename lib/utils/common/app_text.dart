import 'package:flutter/material.dart';
import 'package:ts_system/utils/common/text_style.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  late final bool? isSingleLined;

  AppText.headingOne(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = heading1Style.copyWith(color: color);
  AppText.optionText(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = optionStyle.copyWith(color: color);

  AppText.mainHeading(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = mainHeadingStyle.copyWith(
          color: color,
        );

  AppText.headingTwo(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = heading2Style.copyWith(
          color: color,
        );

  AppText.headingThree(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = heading3Style.copyWith(
          color: color,
        );

  AppText.headline(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = headlineStyle.copyWith(
          color: color,
        );

  AppText.subheading(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = subheadingStyle.copyWith(
          color: color,
        );

  AppText.caption(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = captionStyle.copyWith(color: color);

  AppText.caption1(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = captionStyle1.copyWith(color: color);

  AppText.overline(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = overlineStyle.copyWith(
          color: color,
        );

  AppText.body1(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = body1Style.copyWith(
          color: color,
        );

  AppText.bodyLabel(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.grey,
  }) : style = bodyLabel.copyWith(
          color: color,
        );
  AppText.primaryBodyLabel(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.dark,
  }) : style = bodyLabel.copyWith(
          color: color,
        );

  AppText.body2(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = body2Style.copyWith(
          color: color,
        );

  AppText.body3(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = body3Style.copyWith(
          color: color,
        );

  AppText.body(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = bodyStyle.copyWith(
          color: color,
        );

  AppText.body5(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = body5Style.copyWith(
          color: color,
        );

  AppText.body5underline(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = body5StyleUnderline.copyWith(
          color: color,
        );

  AppText.body4(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = body4Style.copyWith(
          color: TTColors.grey,
        );

  AppText.body6(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = body6Style.copyWith(
          color: color,
        );

  AppText.bodyBold(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = bodyBoldStyle.copyWith(
          color: color,
        );

  AppText.bodyTextButton(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = bodyStyleTextButton.copyWith(
          color: color,
        );
  AppText.bodyBold2(
    this.text, {
    super.key,
    this.textAlign,
    this.isSingleLined,
    Color color = TTColors.black,
  }) : style = bodyBoldStyle2.copyWith(
          color: color,
        );

  @override
  Widget build(BuildContext context) {
    late TextOverflow overflow;
    if (isSingleLined == null || !isSingleLined!) {
      overflow = TextOverflow.clip;
    } else {
      overflow = TextOverflow.ellipsis;
    }

    return Text(
      text,
      style: style.copyWith(),
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
