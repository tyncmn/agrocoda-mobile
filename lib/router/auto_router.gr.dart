// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

/// generated route for
/// [AddCencorView]
class AddCencorRoute extends PageRouteInfo<void> {
  const AddCencorRoute({List<PageRouteInfo>? children})
    : super(AddCencorRoute.name, initialChildren: children);

  static const String name = 'AddCencorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddCencorView();
    },
  );
}

/// generated route for
/// [CencorView]
class CencorRoute extends PageRouteInfo<void> {
  const CencorRoute({List<PageRouteInfo>? children})
    : super(CencorRoute.name, initialChildren: children);

  static const String name = 'CencorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CencorView();
    },
  );
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardView();
    },
  );
}

/// generated route for
/// [EntryView]
class EntryRoute extends PageRouteInfo<void> {
  const EntryRoute({List<PageRouteInfo>? children})
    : super(EntryRoute.name, initialChildren: children);

  static const String name = 'EntryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EntryView();
    },
  );
}

/// generated route for
/// [FieldDetailView]
class FieldDetailRoute extends PageRouteInfo<void> {
  const FieldDetailRoute({List<PageRouteInfo>? children})
    : super(FieldDetailRoute.name, initialChildren: children);

  static const String name = 'FieldDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FieldDetailView();
    },
  );
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainView();
    },
  );
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileView();
    },
  );
}

/// generated route for
/// [SensorResultView]
class SensorResultRoute extends PageRouteInfo<SensorResultRouteArgs> {
  SensorResultRoute({
    Key? key,
    required List<String> names,
    required int fieldId,
    List<PageRouteInfo>? children,
  }) : super(
         SensorResultRoute.name,
         args: SensorResultRouteArgs(key: key, names: names, fieldId: fieldId),
         initialChildren: children,
       );

  static const String name = 'SensorResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SensorResultRouteArgs>();
      return SensorResultView(
        key: args.key,
        names: args.names,
        fieldId: args.fieldId,
      );
    },
  );
}

class SensorResultRouteArgs {
  const SensorResultRouteArgs({
    this.key,
    required this.names,
    required this.fieldId,
  });

  final Key? key;

  final List<String> names;

  final int fieldId;

  @override
  String toString() {
    return 'SensorResultRouteArgs{key: $key, names: $names, fieldId: $fieldId}';
  }
}
