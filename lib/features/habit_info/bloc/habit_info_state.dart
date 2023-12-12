part of 'habit_info_bloc.dart';

@immutable
abstract class HabitInfoState {}

class HabitLoadingState extends HabitInfoState {}

class HabitLoadedState extends HabitInfoState {
  final Habit habit;

  HabitLoadedState({required this.habit});
}

class HabitSavedState extends HabitInfoState {
  final Habit habit;

  HabitSavedState({required this.habit});
}
