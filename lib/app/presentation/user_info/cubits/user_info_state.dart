part of 'user_info_cubit.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object?> get props => [];
}

final class UserInfoInitial extends UserInfoState {
  final String gender;
  final bool autoValidate;
  final bool nameEmpty;
  final bool ageInvalid;

  const UserInfoInitial({
    this.gender = 'Female',
    this.autoValidate = false,
    this.nameEmpty = false,
    this.ageInvalid = false,
  });

  UserInfoInitial copyWith({
    String? gender,
    bool? autoValidate,
    bool? nameEmpty,
    bool? ageInvalid,
  }) {
    return UserInfoInitial(
      gender: gender ?? this.gender,
      autoValidate: autoValidate ?? this.autoValidate,
      nameEmpty: nameEmpty ?? this.nameEmpty,
      ageInvalid: ageInvalid ?? this.ageInvalid,
    );
  }

  @override
  List<Object?> get props => [gender, autoValidate, nameEmpty, ageInvalid];
}

final class UserInfoSuccess extends UserInfoState {
  final CharacterCreateResponse response;
  
  const UserInfoSuccess(this.response);
  
  @override
  List<Object?> get props => [response];
}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoError extends UserInfoState {
  final String error;

  const UserInfoError(this.error);

  @override
  List<Object?> get props => [error];
}
