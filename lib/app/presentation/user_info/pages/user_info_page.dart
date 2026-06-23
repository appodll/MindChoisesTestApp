import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mindchoises_test_app/core/routes/app_routes.dart';
import 'package:mindchoises_test_app/core/widgets/app_loader.dart';

import '../../../../core/constant/app_theme.dart';
import '../cubits/user_info_cubit.dart';
import '../widgets/user_info_continue_button.dart';
import '../widgets/user_info_form_card.dart';
import '../widgets/user_info_header.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserInfoCubit, UserInfoState>(
      listener: (context, state) {
        if (state is UserInfoSuccess) {
          context.push(
            AppRoutes.characterCustomize,
            extra: {
              'name': state.response.name ?? '',
              'age': int.tryParse(state.response.age ?? '') ?? 0,
              'gender': state.response.gender ?? '',
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.scaffoldBg,
        body: BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state) {
            if (state is UserInfoLoading) return const AppLoader();

            return SafeArea(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UserInfoHeader(),
                    SizedBox(height: 32.h),
                    const UserInfoFormCard(),
                    SizedBox(height: 28.h),
                    const UserInfoContinueButton(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
