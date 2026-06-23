part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileSuccess extends ProfileState {
  final CharacterModel character;
  final bool isGenerating;

  const ProfileSuccess({
    required this.character,
    this.isGenerating = false,
  });

  ProfileSuccess copyWith({
    CharacterModel? character,
    bool? isGenerating,
  }) {
    return ProfileSuccess(
      character: character ?? this.character,
      isGenerating: isGenerating ?? this.isGenerating,
    );
  }

  @override
  List<Object?> get props => [character, isGenerating];
}

final class ProfileEmpty extends ProfileState {
  const ProfileEmpty();
}

final class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
