import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/character_model.dart';
import '../../../data/models/remote/request/character_create_request.dart';
import '../../../data/repositories/character_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final CharacterRepository _repository;

  ProfileCubit(this._repository) : super(const ProfileInitial());

  /// Loads persisted character from Firestore on app start.
  Future<void> loadCharacter() async {
    emit(const ProfileLoading());
    try {
      final response = await _repository.getCharacter();
      if (response == null) {
        emit(const ProfileEmpty());
        return;
      }
      final character = CharacterModel(
        id: '',
        userName: response.name ?? '',
        age: int.tryParse(response.age ?? '') ?? 0,
        gender: response.gender ?? '',
        archetype: response.archetype ?? '',
        goal: response.goal ?? '',
        mood: response.mood ?? '',
        aiDescription: response.aiDescription,
        createdAt: response.createdAt ?? DateTime.now(),
      );
      emit(ProfileSuccess(character: character));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  /// Called from SummonButton — saves full character then generates AI description.
  Future<void> saveAndGenerate(CharacterModel character) async {
    // Show profile immediately while saving + AI generates in background
    emit(ProfileSuccess(character: character, isGenerating: true));

    try {
      final request = CharacterCreateRequest.fromModel(character);

      // Upsert full character to Firestore (overwrites the partial record
      // that UserInfoCubit created with only name/age/gender)
      await _repository.createCharacter(request);

      // Generate AI description (falls back to mock if no API key)
      final description = await _repository.generateDescription(request);

      // Persist AI description to Firestore
      final updated = await _repository.updateAiDescription(description);

      final finalCharacter = character.copyWith(
        aiDescription: updated.aiDescription ?? description,
      );

      emit(ProfileSuccess(character: finalCharacter));
    } catch (e) {
      // Keep showing profile even if save/AI fails
      emit(ProfileSuccess(character: character));
    }
  }

  void reset() => emit(const ProfileEmpty());
}
