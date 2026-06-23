import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindchoises_test_app/core/routes/app_routes.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/di/injector.dart';
import '../../../data/models/character_model.dart';
import '../../character_profile/cubits/profile_cubit.dart';
import '../cubits/customize_cubit.dart';

class SummonButton extends StatelessWidget {
  final String userName;
  final int age;
  final String gender;
  final CustomizeInitial state;

  const SummonButton({
    super.key,
    required this.userName,
    required this.age,
    required this.gender,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final archetype = state.archetype;

    return GestureDetector(
      onTap: () {
        final character = CharacterModel(
          id: const Uuid().v4(),
          userName: userName,
          age: age,
          gender: gender,
          archetype: state.archetypeKey,
          goal: state.goal,
          mood: state.mood,
          createdAt: DateTime.now(),
        );

        locator<ProfileCubit>().saveAndGenerate(character);
        context.push(AppRoutes.characterProfile);
      },
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: archetype.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: archetype.primaryColor.withValues(alpha: 0.35),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Summon My Heroine',
              style: GoogleFonts.orbitron(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            SizedBox(width: 10.w),
            const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}
