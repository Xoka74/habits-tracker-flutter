import 'package:habit_tracker/domain/models/habit_priority.dart';

import 'habit_type.dart';

class Habit {
  final String id;
  final String name;
  final String description;
  final HabitPriority priority;
  final HabitType type;
  final int count;
  final DateTime creationDate;
  final bool isSynced;
  final List<int> doneDates;

  Habit(
      {required this.id,
      required this.name,
      required this.description,
      required this.priority,
      required this.type,
      required this.count,
      required this.creationDate,
      required this.isSynced,
      required this.doneDates});

  Habit copyWith({
      String? id,
      String? name,
      String? description,
      HabitPriority? priority,
      HabitType? type,
      int? count,
      DateTime? creationDate,
      bool? isSynced,
      List<int>? doneDates}) {
    return Habit(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      type: type ?? this.type,
      count: count ?? this.count,
      creationDate: creationDate ?? this.creationDate,
      isSynced: isSynced ?? this.isSynced,
      doneDates: doneDates ?? this.doneDates,
    );
  }

// @Embedded val periodicity: TimeInterval = TimeInterval(0, Duration.DAY),
}
