import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_theme.dart';
import '../cubits/customize_cubit.dart';
import '../widgets/archetype_grid.dart';
import '../widgets/customize_section_label.dart';
import '../widgets/customize_top_bar.dart';
import '../widgets/hero_preview_card.dart';
import '../widgets/select_chip_row.dart';
import '../widgets/summon_button.dart';
import '../../../data/models/avatar_data.dart';

class CharacterCustomizePage extends StatelessWidget {
  final String userName;
  final int age;
  final String gender;

  const CharacterCustomizePage({
    super.key,
    required this.userName,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            const CustomizeTopBar(),
            Expanded(
              child: BlocBuilder<CustomizeCubit, CustomizeState>(
                builder: (context, state) {
                  if (state is! CustomizeInitial) return const SizedBox.shrink();
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeroPreviewCard(
                          userName: userName,
                          archetype: state.archetype,
                        ),
                        SizedBox(height: 28.h),
                        const CustomizeSectionLabel('CHOOSE YOUR ARCHETYPE'),
                        SizedBox(height: 14.h),
                        ArchetypeGrid(
                          selected: state.archetypeKey,
                          onSelect: context.read<CustomizeCubit>().selectArchetype,
                        ),
                        SizedBox(height: 28.h),
                        const CustomizeSectionLabel('YOUR CURRENT MOOD'),
                        SizedBox(height: 14.h),
                        SelectChipRow(
                          items: moods,
                          selected: state.mood,
                          onSelect: context.read<CustomizeCubit>().selectMood,
                        ),
                        SizedBox(height: 28.h),
                        const CustomizeSectionLabel('YOUR DRIVING GOAL'),
                        SizedBox(height: 14.h),
                        SelectChipRow(
                          items: goals,
                          selected: state.goal,
                          onSelect: context.read<CustomizeCubit>().selectGoal,
                          wrap: true,
                        ),
                        SizedBox(height: 40.h),
                        SummonButton(
                          userName: userName,
                          age: age,
                          gender: gender,
                          state: state,
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
