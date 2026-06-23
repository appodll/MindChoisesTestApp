import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_theme.dart';

class AiDescriptionCard extends StatelessWidget {
  final String? description;
  final bool isLoading;
  final Color accentColor;

  const AiDescriptionCard({
    super.key,
    required this.description,
    required this.isLoading,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.auto_awesome, color: accentColor, size: 16.sp),
                SizedBox(width: 8.w),
                Text(
                  'AI CHARACTER ORACLE',
                  style: GoogleFonts.orbitron(
                    fontSize: 9.sp,
                    color: accentColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                const Spacer(),
                if (isLoading)
                  SizedBox(
                    width: 14.w,
                    height: 14.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: accentColor,
                    ),
                  ),
              ],
            ),
          ),

          // Body
          Padding(
            padding: EdgeInsets.all(16.r),
            child: isLoading
                ? _LoadingShimmer(color: accentColor)
                : description != null
                    ? Text(
                        description!,
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          color: AppTheme.textPrimary,
                          height: 1.8,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    : Text(
                        'Your story is being woven by the Oracle...',
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          color: AppTheme.textSecondary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}

class _LoadingShimmer extends StatefulWidget {
  final Color color;
  const _LoadingShimmer({required this.color});

  @override
  State<_LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<_LoadingShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        4,
        (i) => FadeTransition(
          opacity: _anim,
          child: Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 12.h,
            width: i == 3 ? 120.w : double.infinity,
            decoration: BoxDecoration(
              color: widget.color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
