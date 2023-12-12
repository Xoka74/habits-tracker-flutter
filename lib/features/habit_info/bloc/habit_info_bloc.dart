import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/domain/models/habit.dart';
import 'package:habit_tracker/domain/repositories/habits_repository.dart';
import 'package:meta/meta.dart';

part 'habit_info_event.dart';

part 'habit_info_state.dart';

class HabitInfoBloc extends Bloc<HabitInfoEvent, HabitInfoState> {
  HabitsRepository get repository => GetIt.instance.get<HabitsRepository>();

  HabitInfoBloc() : super(HabitLoadingState()) {
    on<HabitGetHabitEvent>(_onHabitGetHabit);
    on<HabitSaveHabitEvent>(_onSaveHabit);
  }

  _onHabitGetHabit(
      HabitGetHabitEvent event, Emitter<HabitInfoState> emit) async {
    var habit = await repository.getById(event.habitId!);
    emit(HabitLoadedState(habit: habit!));
  }

  _onSaveHabit(HabitSaveHabitEvent event, Emitter<HabitInfoState> emit) async {
    var habit = event.habit;
    if (habit.id == null) {
      await repository.add(habit);
    } else {
      await repository.update(habit);
    }

    emit(HabitSavedState(habit: habit));
  }
}
