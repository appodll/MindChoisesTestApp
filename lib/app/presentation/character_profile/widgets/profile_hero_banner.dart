import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_theme.dart';
import '../../../data/models/avatar_data.dart';
import '../../../data/models/character_model.dart';

class ProfileHeroBanner extends StatelessWidget {
  final CharacterModel character;
  final AvatarData archetype;

  const ProfileHeroBanner({
    super.key,
    required this.character,
    required this.archetype,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: archetype.primaryColor.withValues(alpha: 0.08),
        border: Border(
          bottom: BorderSide(
            color: archetype.primaryColor.withValues(alpha: 0.15),
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
          child: Column(
            children: [
              // Avatar circle
              Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: archetype.primaryColor.withValues(alpha: 0.12),
                  border: Border.all(
                    color: archetype.primaryColor.withValues(alpha: 0.5),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: archetype.primaryColor.withValues(alpha: 0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    archetype.emoji,
                    style: TextStyle(fontSize: 54.sp),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Name
              Text(
                character.userName,
                style: GoogleFonts.orbitron(
                  fontSize: 24.sp,
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 8.h),

              // Archetype pill
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: archetype.primaryColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'The ${archetype.label}',
                  style: GoogleFonts.orbitron(
                    fontSize: 11.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              // Archetype description
              Text(
                archetype.description,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: archetype.primaryColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
