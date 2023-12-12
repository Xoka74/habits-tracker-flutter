part of 'habit_info_bloc.dart';

@immutable
abstract class HabitInfoEvent {}

class HabitGetHabitEvent extends HabitInfoEvent {
  final String? habitId;

  HabitGetHabitEvent({required this.habitId});
}

class HabitSaveHabitEvent extends HabitInfoEvent {
  final Habit habit;

  HabitSaveHabitEvent({required this.habit});
}
