import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HabitDto {
  final int color;
  final int count;
  final int date;
  final String description;
  final List<int> done_dates;
  final int frequency;
  final int priority;
  final String title;
  final int type;
  final String uid;

  HabitDto(
      {required this.color,
      required this.count,
      required this.date,
      required this.description,
      required this.done_dates,
      required this.frequency,
      required this.priority,
      required this.title,
      required this.type,
      required this.uid});
}
