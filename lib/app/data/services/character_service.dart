import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/base/stroge/stroge_contract.dart';
import '../models/remote/request/character_create_request.dart';
import '../models/remote/response/character_create_response.dart';

class CharacterService {
  static const _deviceTokenKey = 'device_token';

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final StrogeContract _storage;

  CharacterService(this._storage);

  Future<String> _getDeviceToken() async {
    final existing = await _storage.get(_deviceTokenKey);
    if (existing != null && (existing as String).isNotEmpty) return existing;
    final token = const Uuid().v4();
    await _storage.save(_deviceTokenKey, token);
    return token;
  }

  Future<CharacterCreateResponse> createCharacter(
    CharacterCreateRequest request,
  ) async {
    final token = await _getDeviceToken();

    await _fireStore.collection('characters').doc(token).set({
      'device_token': token,
      ...request.toMap(),
      'created_at': FieldValue.serverTimestamp(),
      'updated_at': FieldValue.serverTimestamp(),
    });

    final doc = await _fireStore.collection('characters').doc(token).get();
    return CharacterCreateResponse.fromMap(doc.data()!);
  }

  Future<CharacterCreateResponse> updateAiDescription(
    String aiDescription,
  ) async {
    final token = await _getDeviceToken();

    await _fireStore.collection('characters').doc(token).update({
      'ai_description': aiDescription,
      'updated_at': FieldValue.serverTimestamp(),
    });

    final doc = await _fireStore.collection('characters').doc(token).get();
    return CharacterCreateResponse.fromMap(doc.data()!);
  }

  Future<CharacterCreateResponse?> getCharacter() async {
    final token = await _getDeviceToken();
    final doc = await _fireStore.collection('characters').doc(token).get();
    if (!doc.exists || doc.data() == null) return null;
    return CharacterCreateResponse.fromMap(doc.data()!);
  }
}
