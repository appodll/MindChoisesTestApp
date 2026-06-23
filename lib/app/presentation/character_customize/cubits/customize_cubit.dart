import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/avatar_data.dart';

part 'customize_state.dart';

class CustomizeCubit extends Cubit<CustomizeState> {
  CustomizeCubit() : super(const CustomizeInitial());

  CustomizeInitial get _s => state as CustomizeInitial;

  void selectArchetype(String key) => emit(_s.copyWith(archetypeKey: key));
  void selectMood(String mood) => emit(_s.copyWith(mood: mood));
  void selectGoal(String goal) => emit(_s.copyWith(goal: goal));
}
