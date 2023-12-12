part of 'habit_list_bloc.dart';

abstract class HabitListState {}

class HabitListLoadingState extends HabitListState {}

class HabitFilterUpdatedState extends HabitListState {
    final HabitFilter filter;

  HabitFilterUpdatedState({required this.filter});
}

class HabitListUpdatedState extends HabitListState {
  final List<Habit> habits;

  HabitListUpdatedState({required this.habits});
}

class HabitCompletedState extends HabitListState {
  final Habit habit;

  HabitCompletedState({required this.habit});
}
