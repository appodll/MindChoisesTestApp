import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
  final String id;
  final String userName;
  final int age;
  final String gender;
  final String archetype;
  final String goal;
  final String mood;
  final String? aiDescription;
  final DateTime createdAt;

  const CharacterModel({
    required this.id,
    required this.userName,
    required this.age,
    required this.gender,
    required this.archetype,
    required this.goal,
    required this.mood,
    this.aiDescription,
    required this.createdAt,
  });

  CharacterModel copyWith({
    String? id,
    String? userName,
    int? age,
    String? gender,
    String? archetype,
    String? goal,
    String? mood,
    String? aiDescription,
    DateTime? createdAt,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      archetype: archetype ?? this.archetype,
      goal: goal ?? this.goal,
      mood: mood ?? this.mood,
      aiDescription: aiDescription ?? this.aiDescription,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_name': userName,
        'age': age,
        'gender': gender,
        'archetype': archetype,
        'goal': goal,
        'mood': mood,
        'ai_description': aiDescription,
        'created_at': createdAt.toIso8601String(),
      };

  factory CharacterModel.fromMap(Map<String, dynamic> map) => CharacterModel(
        id: map['id'] as String,
        userName: map['user_name'] as String,
        age: map['age'] as int,
        gender: map['gender'] as String,
        archetype: map['archetype'] as String,
        goal: map['goal'] as String,
        mood: map['mood'] as String,
        aiDescription: map['ai_description'] as String?,
        createdAt: DateTime.parse(map['created_at'] as String),
      );

  @override
  List<Object?> get props =>
      [id, userName, age, gender, archetype, goal, mood, aiDescription, createdAt];
}
