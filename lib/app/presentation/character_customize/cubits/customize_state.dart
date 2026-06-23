part of 'customize_cubit.dart';

sealed class CustomizeState extends Equatable {
  const CustomizeState();

  @override
  List<Object?> get props => [];
}

final class CustomizeInitial extends CustomizeState {
  final String archetypeKey;
  final String mood;
  final String goal;

  const CustomizeInitial({
    this.archetypeKey = 'Warrior',
    this.mood = 'Determined',
    this.goal = 'Find my true purpose',
  });

  AvatarData get archetype => archetypeByKey(archetypeKey);

  CustomizeInitial copyWith({
    String? archetypeKey,
    String? mood,
    String? goal,
  }) {
    return CustomizeInitial(
      archetypeKey: archetypeKey ?? this.archetypeKey,
      mood: mood ?? this.mood,
      goal: goal ?? this.goal,
    );
  }

  @override
  List<Object?> get props => [archetypeKey, mood, goal];
}
