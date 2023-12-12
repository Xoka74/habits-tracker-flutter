import 'package:habit_tracker/domain/models/habit_priority.dart';
import 'package:habit_tracker/domain/models/habit_type.dart';
import 'package:hive/hive.dart';

part 'habit_hive.g.dart';

@HiveType(typeId: 1)
class HabitHive extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  HabitPriority priority;
  @HiveField(4)
  HabitType type;
  @HiveField(5)
  int count;
  @HiveField(6)
  DateTime creationDate;
  @HiveField(7)
  bool isSynced;
  @HiveField(8)
  List<int> doneDates;

  HabitHive(
      {required this.id,
      required this.name,
      required this.description,
      required this.priority,
      required this.type,
      required this.count,
      required this.creationDate,
      required this.isSynced,
      required this.doneDates});
}
