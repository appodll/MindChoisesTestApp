import 'dart:convert';

import 'package:mindchoises_test_app/core/base/model/base_model.dart';

class CharacterCreateResponse extends BaseModel {
  final String? name;
  final String? age;
  final String? gender;
  final String? archetype;
  final String? goal;
  final String? mood;
  final String? aiDescription;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CharacterCreateResponse({
    this.name,
    this.age,
    this.gender,
    this.archetype,
    this.goal,
    this.mood,
    this.aiDescription,
    this.createdAt,
    this.updatedAt,
  });

  factory CharacterCreateResponse.fromMap(Map<String, dynamic> map) =>
      CharacterCreateResponse(
        name: map['name'],
        age: map['age']?.toString(),
        gender: map['gender'],
        archetype: map['archetype'],
        goal: map['goal'],
        mood: map['mood'],
        aiDescription: map['ai_description'],
        createdAt: _toDateTime(map['created_at']),
        updatedAt: _toDateTime(map['updated_at']),
      );

  static DateTime? _toDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    try {
      return (value as dynamic).toDate() as DateTime;
    } catch (_) {}
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  factory CharacterCreateResponse.fromJson(String str) =>
      CharacterCreateResponse.fromMap(json.decode(str));

  Map<String, dynamic> toMap() => {
        'name': name,
        'age': age,
        'gender': gender,
        'archetype': archetype,
        'goal': goal,
        'mood': mood,
        'ai_description': aiDescription,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props =>
      [name, age, gender, archetype, goal, mood, aiDescription, createdAt, updatedAt];
}
