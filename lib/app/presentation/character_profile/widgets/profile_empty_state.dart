import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindchoises_test_app/core/routes/app_routes.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_theme.dart';

class ProfileEmptyState extends StatelessWidget {
  const ProfileEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🌙', style: TextStyle(fontSize: 64.sp)),
          SizedBox(height: 16.h),
          Text(
            'No heroine yet',
            style: GoogleFonts.orbitron(
              color: AppTheme.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: () => context.go(AppRoutes.userInfo),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                'Create One',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
