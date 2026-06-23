import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_theme.dart';
import '../cubits/user_info_cubit.dart';
import 'gender_chip_row.dart';
import 'section_label.dart';

class UserInfoFormCard extends StatelessWidget {
  const UserInfoFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserInfoCubit>();

    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is! UserInfoInitial) return const SizedBox.shrink();

        return Container(
          decoration: AppTheme.card,
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionLabel('YOUR NAME'),
              SizedBox(height: 10.h),
              TextField(
                controller: cubit.nameController,
                style: GoogleFonts.poppins(
                  color: AppTheme.textPrimary,
                  fontSize: 15.sp,
                ),
                decoration: AppTheme.lightInputDecoration(
                  hint: 'Enter your name',
                  prefix: const Icon(
                    Icons.person_outline,
                    color: AppTheme.textHint,
                  ),
                ),
                textCapitalization: TextCapitalization.words,
              ),
              if (state.autoValidate && state.nameEmpty)
                _errorText('Name is required'),
              SizedBox(height: 20.h),
              const SectionLabel('YOUR AGE'),
              SizedBox(height: 10.h),
              TextField(
                controller: cubit.ageController,
                style: GoogleFonts.poppins(
                  color: AppTheme.textPrimary,
                  fontSize: 15.sp,
                ),
                decoration: AppTheme.lightInputDecoration(
                  hint: 'Enter your age',
                  prefix: const Icon(
                    Icons.cake_outlined,
                    color: AppTheme.textHint,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              if (state.autoValidate && state.ageInvalid)
                _errorText('Please enter a valid age (10–120)'),
              SizedBox(height: 20.h),
              const SectionLabel('YOUR GENDER'),
              SizedBox(height: 12.h),
              GenderChipRow(
                selected: state.gender,
                onSelect: cubit.setGender,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _errorText(String msg) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 4),
      child: Text(
        msg,
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: AppColors.errorColor,
        ),
      ),
    );
  }
}
