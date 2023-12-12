part of 'habit_list_bloc.dart';

abstract class HabitListEvent {
  const HabitListEvent();
}

class ChangeFilterEvent extends HabitListEvent {
  final HabitFilter filter;

  ChangeFilterEvent(HabitFilter? filter) : filter = filter ?? HabitFilter();
}

class ChangeSearchQueryEvent extends HabitListEvent {
  final String text;

  ChangeSearchQueryEvent({required this.text});
}

class HabitsGetHabitsEvent extends HabitListEvent {}

class CompleteHabitEvent extends HabitListEvent {
  final Habit habit;

  CompleteHabitEvent({required this.habit});
}

class DeleteHabitEvent extends HabitListEvent {
  final Habit habit;

  DeleteHabitEvent({required this.habit});
}
