import 'package:flutter/material.dart';
import 'package:ichota_mobile_app/utils/constants/app_fonts.dart';

class AppTextBase extends StatelessWidget {
  const AppTextBase(
    this.text, {
    this.style,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.visible,
    this.maxLines = 1,
    this.softWrap,
    super.key,
    this.height,
    this.letterSpacing,
  }) : assert(text != null, 'test cannot be null');

  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final double? height;
  final double? letterSpacing;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.poppins,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class TextRegular extends AppTextBase {
  TextRegular(
    String super.text, {
    super.key,
    TextStyle? style,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    double? height,
    double? letterSpacing,
    super.textAlign,
    super.overflow,
    super.softWrap,
    super.maxLines = 3,
  })  : _color = color,
        super(
          style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  height: height,
                  letterSpacing: letterSpacing)
              .merge(style),
        );

  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return AppTextBase(
      super.text ?? '',
      textAlign: textAlign,
      style: TextStyle(
              color: _color ?? Colors.black,
              height: height,
              letterSpacing: letterSpacing)
          .merge(super.style),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class TextHeader extends AppTextBase {
  const TextHeader(
    String super.text, {
    super.key,
    super.style,
    double fontSize = 16,
    super.textAlign = null,
    TextOverflow? overflow,
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    super.maxLines = 2,
    super.softWrap,
  })  : _customStyle = style,
        _fontSize = fontSize,
        _color = color ?? Colors.black,
        _fontWeight = fontWeight,
        super(
          overflow: overflow ?? TextOverflow.ellipsis,
        );

  final TextStyle? _customStyle;
  final double _fontSize;
  final Color? _color;
  final FontWeight? _fontWeight;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: _fontSize,
      fontWeight: _fontWeight,
      color: _color ?? Colors.black,
    ).merge(_customStyle);
    return AppTextBase(
      text ?? '',
      style: textStyle,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
