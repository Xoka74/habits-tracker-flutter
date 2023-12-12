import 'package:habit_tracker/domain/models/habit.dart';

import 'habit_hive.dart';

extension HabitHiveExtension on HabitHive {
  Habit toDomainModel() {
    return Habit(
        id: id,
        name: name,
        description: description,
        priority: priority,
        type: type,
        count: count,
        creationDate: creationDate,
        isSynced: isSynced,
        doneDates: doneDates);
  }
}

extension HabitExtension on Habit {
  HabitHive toHiveModel() {
    return HabitHive(
        id: id,
        name: name,
        description: description,
        priority: priority,
        type: type,
        count: count,
        creationDate: creationDate,
        isSynced: isSynced,
        doneDates: doneDates);
  }
}
