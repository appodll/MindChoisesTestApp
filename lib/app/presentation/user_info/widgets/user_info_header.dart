import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_theme.dart';

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.accentLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text('⚡', style: TextStyle(fontSize: 28)),
        ),
        SizedBox(height: 20.h),
        Text(
          'Who Are You?',
          style: GoogleFonts.orbitron(
            fontSize: 26.sp,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Your heroine is a reflection of you.\nTell us a little about yourself.',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppTheme.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
