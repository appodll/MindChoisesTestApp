import 'package:mindchoises_test_app/app/data/contracts/character_contract.dart';
import 'package:mindchoises_test_app/app/data/models/remote/request/character_create_request.dart';
import 'package:mindchoises_test_app/app/data/models/remote/response/character_create_response.dart';
import 'package:mindchoises_test_app/app/data/services/character_service.dart';
import 'package:mindchoises_test_app/core/service/openai_service.dart';

class CharacterRepository implements CharacterContract {
  final CharacterService _service;
  final OpenAiService _ai;

  CharacterRepository(this._service, this._ai);

  @override
  Future<CharacterCreateResponse> createCharacter(
    CharacterCreateRequest request,
  ) =>
      _service.createCharacter(request);

  @override
  Future<CharacterCreateResponse> updateAiDescription(
    String aiDescription,
  ) =>
      _service.updateAiDescription(aiDescription);

  @override
  Future<CharacterCreateResponse?> getCharacter() => _service.getCharacter();

  Future<String> generateDescription(CharacterCreateRequest request) =>
      _ai.generateDescription(request);
}
