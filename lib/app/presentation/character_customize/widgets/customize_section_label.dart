import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';

class CustomizeSectionLabel extends StatelessWidget {
  final String text;

  const CustomizeSectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.orbitron(
        fontSize: 10.sp,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
      ),
    );
  }
}
