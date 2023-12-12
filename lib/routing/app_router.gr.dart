// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HabitInfoRoute.name: (routeData) {
      final args = routeData.argsAs<HabitInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HabitInfoScreen(
          key: args.key,
          habitId: args.habitId,
        ),
      );
    },
    HabitListRoute.name: (routeData) {
      final args = routeData.argsAs<HabitListRouteArgs>(
          orElse: () => const HabitListRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HabitListScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [HabitInfoScreen]
class HabitInfoRoute extends PageRouteInfo<HabitInfoRouteArgs> {
  HabitInfoRoute({
    Key? key,
    required String? habitId,
    List<PageRouteInfo>? children,
  }) : super(
          HabitInfoRoute.name,
          args: HabitInfoRouteArgs(
            key: key,
            habitId: habitId,
          ),
          initialChildren: children,
        );

  static const String name = 'HabitInfoRoute';

  static const PageInfo<HabitInfoRouteArgs> page =
      PageInfo<HabitInfoRouteArgs>(name);
}

class HabitInfoRouteArgs {
  const HabitInfoRouteArgs({
    this.key,
    required this.habitId,
  });

  final Key? key;

  final String? habitId;

  @override
  String toString() {
    return 'HabitInfoRouteArgs{key: $key, habitId: $habitId}';
  }
}

/// generated route for
/// [HabitListScreen]
class HabitListRoute extends PageRouteInfo<HabitListRouteArgs> {
  HabitListRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HabitListRoute.name,
          args: HabitListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HabitListRoute';

  static const PageInfo<HabitListRouteArgs> page =
      PageInfo<HabitListRouteArgs>(name);
}

class HabitListRouteArgs {
  const HabitListRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HabitListRouteArgs{key: $key}';
  }
}
