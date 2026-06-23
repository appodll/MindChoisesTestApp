import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindchoises_test_app/core/constant/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color color;
  final TextAlign align;
  final TextOverflow overflow;
  final String fontType;
  final int? maxLines;
  final double letterSpacing;
  final dynamic keyy;
  final TextDecoration? textDecoration;

  const AppText(
    this.text, {
    super.key,
    this.size,
    this.fontWeight,
    this.color = AppColors.textColor,
    this.align = TextAlign.start,
    this.overflow = TextOverflow.visible,
    this.letterSpacing = 0,
    this.fontType = 'poppins',
    this.maxLines,
    this.textDecoration,
    this.keyy,
  });

  TextStyle _getTextStyle(Color effectiveColor) {
    final baseStyle = TextStyle(
      decoration: textDecoration,
      decorationColor: color,
      fontSize: size?.sp ?? 14.sp,
      fontWeight: fontWeight,
      color: effectiveColor,
      letterSpacing: letterSpacing,
    );

    switch (fontType) {
      case 'notoSans':
        return GoogleFonts.notoSans(textStyle: baseStyle);
      case 'inter':
        return GoogleFonts.inter(textStyle: baseStyle);
      case 'opensans':
        return GoogleFonts.openSans(
          textStyle: baseStyle.copyWith(fontStyle: FontStyle.italic),
        );
      case 'lato':
        return GoogleFonts.lato(textStyle: baseStyle);
      case 'orbitron':
        return GoogleFonts.orbitron(textStyle: baseStyle);
      case 'poppins':
      default:
        return GoogleFonts.poppins(textStyle: baseStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(color),
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
