import 'package:get_it/get_it.dart';
import 'package:habit_tracker/data/hive_objects/habit_hive.dart';
import 'package:habit_tracker/domain/models/habit.dart';
import 'package:habit_tracker/features/habit_info/bloc/habit_info_bloc.dart';
import 'package:habit_tracker/features/habit_list/bloc/habit_list_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import 'init.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  getIt.init();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitHiveAdapter());
  var box = await Hive.openBox<HabitHive>("habits");

  getIt.registerFactory(() => box);
  getIt.registerFactory<HabitListBloc>(() => HabitListBloc());
  getIt.registerFactory<HabitInfoBloc>(() => HabitInfoBloc());
}
