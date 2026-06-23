import 'dart:convert';

import 'package:mindchoises_test_app/app/data/models/character_model.dart';
import 'package:mindchoises_test_app/core/base/model/base_model.dart';

class CharacterCreateRequest extends BaseModel {
  final String? name;
  final String? age;
  final String? gender;
  final String? archetype;
  final String? goal;
  final String? mood;
  final String? aiDescription;

  CharacterCreateRequest({
    this.name,
    this.age,
    this.gender,
    this.archetype,
    this.goal,
    this.mood,
    this.aiDescription,
  });

  factory CharacterCreateRequest.fromModel(CharacterModel model) =>
      CharacterCreateRequest(
        name: model.userName,
        age: model.age.toString(),
        gender: model.gender,
        archetype: model.archetype,
        goal: model.goal,
        mood: model.mood,
        aiDescription: model.aiDescription,
      );

  factory CharacterCreateRequest.fromMap(Map<String, dynamic> map) =>
      CharacterCreateRequest(
        name: map['name'],
        age: map['age'],
        gender: map['gender'],
        archetype: map['archetype'],
        goal: map['goal'],
        mood: map['mood'],
        aiDescription: map['ai_description'],
      );

  factory CharacterCreateRequest.fromJson(String str) =>
      CharacterCreateRequest.fromMap(json.decode(str));

  Map<String, dynamic> toMap() => {
        'name': name,
        'age': age,
        'gender': gender,
        'archetype': archetype,
        'goal': goal,
        'mood': mood,
        'ai_description': aiDescription,
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [name, age, gender, archetype, goal, mood, aiDescription];
}
