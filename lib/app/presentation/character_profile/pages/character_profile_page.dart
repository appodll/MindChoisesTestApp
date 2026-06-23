import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindchoises_test_app/core/widgets/app_loader.dart';
import 'package:mindchoises_test_app/core/widgets/app_text.dart';

import '../../../../core/constant/app_theme.dart';
import '../../../data/models/avatar_data.dart';
import '../../../data/models/character_model.dart';
import '../cubits/profile_cubit.dart';
import '../widgets/ai_description_card.dart';
import '../widgets/profile_empty_state.dart';
import '../widgets/profile_hero_banner.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_stats_row.dart';
import '../widgets/reforge_button.dart';

class CharacterProfilePage extends StatelessWidget {
  const CharacterProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading || state is ProfileInitial) {
            return const AppLoader();
          }
          if (state is ProfileEmpty) {
            return const ProfileEmptyState();
          }
          if (state is ProfileError) {
            return Center(child: AppText(state.message));
          }
          if (state is ProfileSuccess) {
            return _ProfileContent(
              character: state.character,
              isGenerating: state.isGenerating,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final CharacterModel character;
  final bool isGenerating;

  const _ProfileContent({required this.character, required this.isGenerating});

  @override
  Widget build(BuildContext context) {
    final archetype = archetypeByKey(character.archetype);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full-bleed hero — includes SafeArea for top
          ProfileHeroBanner(character: character, archetype: archetype),

          // Body content
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quick stats: age / gender / mood
                ProfileStatsRow(character: character, archetype: archetype),
                SizedBox(height: 20.h),

                // AI Oracle description
                AiDescriptionCard(
                  description: character.aiDescription,
                  isLoading: isGenerating,
                  accentColor: archetype.primaryColor,
                ),
                SizedBox(height: 20.h),

                // Archetype / goal / mood / created
                ProfileInfoCard(character: character, archetype: archetype),
                SizedBox(height: 28.h),

                // Reforge
                ReforgeButton(archetype: archetype),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
