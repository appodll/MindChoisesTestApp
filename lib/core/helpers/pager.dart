import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindchoises_test_app/app/presentation/character_customize/cubits/customize_cubit.dart';
import 'package:mindchoises_test_app/app/presentation/character_customize/pages/character_customize_page.dart';
import 'package:mindchoises_test_app/app/presentation/character_profile/cubits/profile_cubit.dart';
import 'package:mindchoises_test_app/app/presentation/character_profile/pages/character_profile_page.dart';
import 'package:mindchoises_test_app/app/presentation/user_info/cubits/user_info_cubit.dart';
import 'package:mindchoises_test_app/app/presentation/user_info/pages/user_info_page.dart';
import 'package:mindchoises_test_app/core/di/injector.dart';

class Pager {
  Pager._();

  static Widget userInfo() => BlocProvider(
    create: (context) => UserInfoCubit(locator()),
    child: UserInfoPage(),
  );
 
  static Widget characterCustomize({
    required String name,
    required int age,
    required String gender,
  }) => BlocProvider(
    create: (_) => CustomizeCubit(),
    child: CharacterCustomizePage(userName: name, age: age, gender: gender),
  );

  static Widget characterProfile() => BlocProvider.value(
    value: locator<ProfileCubit>()..loadCharacter(),
    child: const CharacterProfilePage(),
  );
}
