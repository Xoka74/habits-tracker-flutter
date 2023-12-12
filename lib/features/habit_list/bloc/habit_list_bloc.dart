import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/domain/models/habit.dart';
import 'package:habit_tracker/domain/repositories/habits_repository.dart';
import 'package:habit_tracker/features/habit_list/filtering/filter.dart';

part 'habit_list_event.dart';

part 'habit_list_state.dart';

class HabitListBloc extends Bloc<HabitListEvent, HabitListState> {
  HabitsRepository get repository => GetIt.instance.get<HabitsRepository>();

  HabitListBloc() : super(HabitListLoadingState()) {
    on<HabitsGetHabitsEvent>(_onGetHabits);
    on<CompleteHabitEvent>(_onHabitCompleted);
    on<DeleteHabitEvent>(_onHabitDeleted);
    on<ChangeSearchQueryEvent>(_onSearchQueryChanged);
    on<ChangeFilterEvent>(_onHabitFilterChanged);
  }

  _onHabitFilterChanged(
      ChangeFilterEvent event, Emitter<HabitListState> emit) async {
    var filtered = (await repository.getAll())
        .where((element) => event.filter.isFiltered(element))
        .toList();
    emit(HabitFilterUpdatedState(filter: event.filter));
    // emit(HabitListUpdatedState(habits: filtered));
  }

  _onSearchQueryChanged(
      ChangeSearchQueryEvent event, Emitter<HabitListState> emit) async {
    var filtered = (await repository.getAll())
        .where((element) =>
            element.name.toLowerCase().contains(event.text.toLowerCase()))
        .toList();
    emit(HabitListUpdatedState(habits: filtered));
  }

  _onHabitDeleted(DeleteHabitEvent event, Emitter<HabitListState> emit) async {
    repository.delete(event.habit);
    emit(HabitListUpdatedState(habits: await repository.getAll()));
  }

  _onGetHabits(HabitsGetHabitsEvent event, Emitter<HabitListState> emit) async {
    emit(HabitListLoadingState());
    emit(HabitListUpdatedState(habits: await repository.getAll()));
  }

  _onHabitCompleted(
      CompleteHabitEvent event, Emitter<HabitListState> emit) async {
    var updatedHabit = event.habit.copyWith(count: event.habit.count + 1);
    repository.update(updatedHabit);
    emit(HabitCompletedState(habit: updatedHabit));
    emit(HabitListUpdatedState(habits: await repository.getAll()));
  }
}
