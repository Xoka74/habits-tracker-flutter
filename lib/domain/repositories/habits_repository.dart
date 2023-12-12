import '../models/habit.dart';

abstract class HabitsRepository {
  Future<List<Habit>> getAll();

  Future add(Habit habit);

  Future delete(Habit habit);

  Future update(Habit habit);

  Future<Habit?> getById(String id);
}
