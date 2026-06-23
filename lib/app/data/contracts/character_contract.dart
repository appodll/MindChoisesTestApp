import '../models/remote/request/character_create_request.dart';
import '../models/remote/response/character_create_response.dart';

abstract class CharacterContract {
  Future<CharacterCreateResponse> createCharacter(CharacterCreateRequest request);
  Future<CharacterCreateResponse> updateAiDescription(String aiDescription);
  Future<CharacterCreateResponse?> getCharacter();
}
