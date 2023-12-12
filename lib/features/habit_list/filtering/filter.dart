import 'package:habit_tracker/domain/models/habit.dart';
import 'package:habit_tracker/domain/models/habit_priority.dart';
import 'package:habit_tracker/domain/models/habit_type.dart';

class Filter<T> {
  T value;
  bool trigger;

  Filter(this.value, this.trigger);
}

class HabitFilter {
  final List<Filter<HabitType>> typeFilters;
  final List<Filter<HabitPriority>> priorityFilters;

  HabitFilter({
    List<Filter<HabitType>>? typeFilters,
    List<Filter<HabitPriority>>? priorityFilters,
  })  : typeFilters = typeFilters ??
            HabitType.values.map((e) => Filter(e, true)).toList(),
        priorityFilters = priorityFilters ??
            HabitPriority.values.map((e) => Filter(e, true)).toList();

  HabitFilter copyWith({
    List<Filter<HabitType>>? typeFilters,
    List<Filter<HabitPriority>>? priorityFilters,
  }) {
    return HabitFilter(
        typeFilters: typeFilters ?? this.typeFilters,
        priorityFilters: priorityFilters ?? this.priorityFilters);
  }



  bool isFiltered(Habit habit){
      var filteredByType = typeFilters.where((element) => element.trigger)
          .map((e) => e.value)
          .contains(habit.type);
      var filteredByPriority =  priorityFilters.where((element) => element.trigger)
          .map((e) => e.value)
          .contains(habit.priority);
      return filteredByType || filteredByPriority;
  }
}
