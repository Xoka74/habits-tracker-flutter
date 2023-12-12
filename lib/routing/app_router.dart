import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/features/habit_info/screens/habit_info_screen.dart';
import 'package:habit_tracker/features/habit_list/screens/habit_list_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HabitListRoute.page, initial: true),
        AutoRoute(page: HabitInfoRoute.page)
      ];
}
