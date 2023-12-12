import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/di/init.dart';
import 'package:habit_tracker/features/habit_info/bloc/habit_info_bloc.dart';

@RoutePage()
class HabitInfoScreen extends StatelessWidget {
  final String? habitId;

  HabitInfoScreen({super.key, required this.habitId});

  final bloc = getIt.get<HabitInfoBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habits")),
      body: _buildScaffoldBody(context),
    );
  }

  Widget _buildScaffoldBody(BuildContext context) {
    bloc.add(HabitGetHabitEvent(habitId: habitId));
    return BlocConsumer<HabitInfoBloc, HabitInfoState>(
      bloc: bloc,
      builder: (context, state) {
        return Form(
            child: Column(
          children: [
            if (state is! HabitLoadedState)
              const Text("Loading...")
            else
              TextFormField(
                initialValue: state.habit.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
          ],
        ));
      },
      listener: (context, state) {},
    );
  }
}
