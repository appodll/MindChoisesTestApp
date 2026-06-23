import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constant/app_theme.dart';
import '../../../data/models/avatar_data.dart';

class ArchetypeGrid extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelect;

  const ArchetypeGrid({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.85,
      ),
      itemCount: archetypes.length,
      itemBuilder: (context, i) {
        final a = archetypes[i];
        final isSelected = selected == a.key;
        return GestureDetector(
          onTap: () => onSelect(a.key),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected
                  ? a.primaryColor.withValues(alpha: 0.12)
                  : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? a.primaryColor : AppTheme.divider,
                width: isSelected ? 2 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: a.primaryColor.withValues(alpha: 0.2),
                        blurRadius: 12,
                        spreadRadius: 1,
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(a.emoji, style: TextStyle(fontSize: 32.sp)),
                SizedBox(height: 6.h),
                Text(
                  a.label,
                  style: GoogleFonts.orbitron(
                    fontSize: 9.sp,
                    color: isSelected ? a.primaryColor : AppTheme.textSecondary,
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
