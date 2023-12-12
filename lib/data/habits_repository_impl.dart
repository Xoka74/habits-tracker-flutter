import 'dart:async';

import 'package:habit_tracker/data/hive_objects/habit_hive.dart';
import 'package:habit_tracker/data/hive_objects/mappers.dart';
import 'package:habit_tracker/di/init.dart';
import 'package:habit_tracker/domain/models/habit.dart';
import 'package:habit_tracker/domain/repositories/habits_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@Singleton(as: HabitsRepository)
class HabitsRepositoryImpl extends HabitsRepository {
  Box<HabitHive> get habitBox => getIt.get<Box<HabitHive>>();

  @override
  Future<List<Habit>> getAll() {
    return Future.value(habitBox.values.map((e) => e.toDomainModel()).toList());
  }

  @override
  Future add(Habit habit) async {
    var id = const Uuid().v4();
    var habitHive = habit.toHiveModel();
    habitHive.id = id;
    await habitBox.put(id, habitHive);
  }

  @override
  Future delete(Habit habit) async {
    await habitBox.delete(habit.id);
  }

  @override
  Future update(Habit habit) async {
    await habitBox.put(habit.id, habit.toHiveModel());
  }

  @override
  Future<Habit?> getById(String id) async {
    return habitBox.get(id)?.toDomainModel();
  }
}
