import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_theme.dart';
import '../../../data/models/avatar_data.dart';
import '../../../data/models/character_model.dart';

class ProfileStatsRow extends StatelessWidget {
  final CharacterModel character;
  final AvatarData archetype;

  const ProfileStatsRow({
    super.key,
    required this.character,
    required this.archetype,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatBadge(
            icon: '🎂',
            label: 'Age',
            value: '${character.age}',
            color: archetype.primaryColor,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _StatBadge(
            icon: character.gender == 'Female'
                ? '♀'
                : character.gender == 'Male'
                    ? '♂'
                    : '⚧',
            label: 'Gender',
            value: character.gender,
            color: archetype.primaryColor,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _StatBadge(
            icon: _moodEmoji(character.mood),
            label: 'Mood',
            value: character.mood,
            color: archetype.primaryColor,
          ),
        ),
      ],
    );
  }

  String _moodEmoji(String mood) {
    const map = {
      'Determined': '🔥',
      'Curious': '🔍',
      'Melancholic': '🌧',
      'Energetic': '⚡',
      'Serene': '🌿',
      'Defiant': '⚔️',
      'Hopeful': '🌅',
      'Restless': '🌀',
    };
    return map[mood] ?? '✨';
  }
}

class _StatBadge extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final Color color;

  const _StatBadge({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          SizedBox(height: 5.h),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Text(
            label.toUpperCase(),
            style: GoogleFonts.poppins(
              fontSize: 8.sp,
              color: AppTheme.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
