import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constant/app_theme.dart';
import '../../../data/models/avatar_data.dart';

class HeroPreviewCard extends StatelessWidget {
  final String userName;
  final AvatarData archetype;

  const HeroPreviewCard({
    super.key,
    required this.userName,
    required this.archetype,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(28.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: archetype.primaryColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: archetype.primaryColor.withValues(alpha: 0.15),
            blurRadius: 24,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 88.w,
            height: 88.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: archetype.primaryColor.withValues(alpha: 0.1),
              border: Border.all(
                color: archetype.primaryColor.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Center(
              child: Text(archetype.emoji, style: TextStyle(fontSize: 40.sp)),
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            userName,
            style: GoogleFonts.orbitron(
              fontSize: 20.sp,
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'The ${archetype.label}',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: archetype.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            archetype.description,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: AppTheme.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
