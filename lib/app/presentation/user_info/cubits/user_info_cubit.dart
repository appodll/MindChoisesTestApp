
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindchoises_test_app/app/data/contracts/character_contract.dart';
import 'package:mindchoises_test_app/app/data/models/remote/request/character_create_request.dart';
import 'package:mindchoises_test_app/app/data/models/remote/response/character_create_response.dart';
import 'package:mindchoises_test_app/core/helpers/error_handler.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final CharacterContract _characterContract;

  UserInfoCubit(this._characterContract) : super(const UserInfoInitial());

  UserInfoInitial get _s =>
      state is UserInfoInitial ? state as UserInfoInitial : const UserInfoInitial();

  void setGender(String value) => emit(_s.copyWith(gender: value));

  void createHero() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final ageInt = int.tryParse(age) ?? -1;

    final nameEmpty = name.isEmpty;
    final ageInvalid = age.isEmpty || ageInt < 10 || ageInt > 120;

    if (nameEmpty || ageInvalid) {
      emit(_s.copyWith(
        autoValidate: true,
        nameEmpty: nameEmpty,
        ageInvalid: ageInvalid,
      ));
      return;
    }

    final gender = _s.gender; 

    try {
      emit(UserInfoLoading());
      final request = CharacterCreateRequest(
        name: name,
        age: age,
        gender: gender,
      );
      final response = await _characterContract.createCharacter(request);
      emit(UserInfoSuccess(response));
    } catch (e,s) {
      log(e.toString());
      log(s.toString());
      final appError = ErrorHandler.handle(e);
      emit(UserInfoError(appError.message ?? ""));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    ageController.dispose();
    return super.close();
  }
}
