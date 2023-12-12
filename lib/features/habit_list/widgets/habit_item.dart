import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/models/habit.dart';
import 'package:habit_tracker/domain/models/habit_type.dart';

class HabitItem extends StatelessWidget {
  final Habit habit;
  final VoidCallback onPressed;
  final VoidCallback onCompletePressed;

  const HabitItem(
      {super.key,
      required this.habit,
      required this.onPressed,
      required this.onCompletePressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPressed,
        leading: Icon(
            habit.type == HabitType.good ? Icons.mood : Icons.mood_bad,
            color: habit.type == HabitType.good ? Colors.green : Colors.red),
        title: Text(habit.name),
        subtitle: Text(habit.description.characters.take(40).string),
        trailing: IconButton(
          color: Colors.blue,
          iconSize: 22,
          icon: const Icon(Icons.check),
          onPressed: onCompletePressed,
        ));
  }
}
