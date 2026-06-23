import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constant/app_colors.dart';

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.orbitron(
        fontSize: 10,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
      ),
    );
  }
}
