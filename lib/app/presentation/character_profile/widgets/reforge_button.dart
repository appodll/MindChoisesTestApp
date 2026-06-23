import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindchoises_test_app/core/routes/app_routes.dart';

import '../../../../core/di/injector.dart';
import '../../../data/models/avatar_data.dart';
import '../cubits/profile_cubit.dart';

class ReforgeButton extends StatelessWidget {
  final AvatarData archetype;

  const ReforgeButton({super.key, required this.archetype});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<ProfileCubit>().reset();
        context.go(AppRoutes.userInfo);
      },
      child: Container(
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: archetype.primaryColor.withValues(alpha: 0.5),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: archetype.primaryColor.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.refresh_rounded, color: archetype.primaryColor, size: 20),
            SizedBox(width: 10.w),
            Text(
              'Reforge Heroine',
              style: GoogleFonts.orbitron(
                color: archetype.primaryColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
