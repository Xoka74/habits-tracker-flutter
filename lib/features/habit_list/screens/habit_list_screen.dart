import 'package:auto_route/auto_route.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/di/init.dart';
import 'package:habit_tracker/domain/models/habit_priority.dart';
import 'package:habit_tracker/domain/models/habit_type.dart';
import 'package:habit_tracker/features/habit_list/bloc/habit_list_bloc.dart';
import 'package:habit_tracker/features/habit_list/widgets/habit_item.dart';
import 'package:habit_tracker/routing/app_router.dart';

@RoutePage()
class HabitListScreen extends StatelessWidget {
  HabitListScreen({Key? key}) : super(key: key);

  final bloc = getIt.get<HabitListBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Habits")),
        body: _buildScaffoldBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(HabitInfoRoute(habitId: null));
          },
          child: const Icon(Icons.add),
        ));
  }

  Widget filtersBottomSheet(BuildContext context) {
    bloc.add(ChangeFilterEvent(null));
    return Container(
      margin: const EdgeInsets.all(20),
      child: Wrap(
        children: [filterHabitPriority(context),
          // filterHabitType(context)
        ],
      ),
    );
  }

  Widget filterHabitPriority(BuildContext context) {
    return BlocConsumer<HabitListBloc, HabitListState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HabitFilterUpdatedState) {
          return Wrap(
            children: [
              const Text("Select priority"),
              for (var filter in state.filter.priorityFilters)
                ListTile(
                    title: Text(StringUtils.capitalize(filter.value.name)),
                    leading: Checkbox(
                      onChanged: (bool? value) {
                        var newFilter = state.filter.priorityFilters;
                        var updatedEl = newFilter.firstWhere((element) => element.value == filter.value);
                        updatedEl.trigger = value!;
                        bloc.add(ChangeFilterEvent(state.filter.copyWith(
                            priorityFilters: newFilter,
                        )));
                      },
                      value: filter.trigger,
                    ))
            ],
          );
        } else {
          return Wrap();
        }
      },
    );
  }

  // Widget filterHabitType(BuildContext context) {
  //   return BlocConsumer<HabitListBloc, HabitListState>(
  //     listener: (context, state) {},
  //     builder: (context, state) {
  //       return Wrap(
  //         children: [
  //           const Text("Select type"),
  //           for (var type in HabitType.values)
  //             ListTile(
  //                 title: Text(StringUtils.capitalize(type.name)),
  //                 leading: Checkbox(
  //                     onChanged: (bool? value) {
  //                       if (state is)
  //                         bloc.add(ChangeFilterEvent(filter: state.))
  //                       bloc.add(ChangeFilterEvent(
  //                           habitType: type, turnOn: value!));
  //                     },
  //                     value: true))
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget searchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) =>
                  bloc.add(ChangeSearchQueryEvent(text: value)),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20,
                ),
                prefixIconConstraints:
                BoxConstraints(maxHeight: 20, minWidth: 25),
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context, builder: filtersBottomSheet);
            },
            icon: const Icon(Icons.filter_alt_outlined),
          )
        ],
      ),
    );
  }

  Widget _buildScaffoldBody(BuildContext context) {
    bloc.add(HabitsGetHabitsEvent());

    return BlocConsumer<HabitListBloc, HabitListState>(
      bloc: bloc,
      builder: (context, state) {
        return Column(
          children: [
            searchBar(context),
            Expanded(
              child: ListView(
                children: [
                  if (state is HabitListLoadingState) const Text("Loading..."),
                  if (state is HabitListUpdatedState)
                    ...state.habits.map((e) =>
                        HabitItem(
                          habit: e,
                          onPressed: () {
                            context.router.push(HabitInfoRoute(habitId: e.id));
                          },
                          onCompletePressed: () {
                            bloc.add(CompleteHabitEvent(habit: e));
                          },
                        ))
                ],
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is HabitCompletedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.habit.count.toString())));
        }
      },
    );
  }
}
