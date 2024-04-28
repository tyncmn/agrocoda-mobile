// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:cookers_app/view/add_cencor_view.dart' as _i1;
import 'package:cookers_app/view/cencor_view.dart' as _i2;
import 'package:cookers_app/view/entry_view.dart' as _i3;
import 'package:cookers_app/view/field_detail_view.dart' as _i4;
import 'package:cookers_app/view/home_view.dart' as _i5;
import 'package:cookers_app/view/login_view.dart' as _i6;
import 'package:cookers_app/view/main_view.dart' as _i7;
import 'package:cookers_app/view/profile_view.dart' as _i8;
import 'package:cookers_app/view/sensor_results_view.dart' as _i9;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AddCencorRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddCencorView(),
      );
    },
    CencorRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CencorView(),
      );
    },
    EntryRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EntryView(),
      );
    },
    FieldDetailRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FieldDetailView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginView(),
      );
    },
    MainRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileView(),
      );
    },
    SensorResultRoute.name: (routeData) {
      final args = routeData.argsAs<SensorResultRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SensorResultView(
          key: args.key,
          names: args.names,
          fieldId: args.fieldId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCencorView]
class AddCencorRoute extends _i10.PageRouteInfo<void> {
  const AddCencorRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddCencorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCencorRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CencorView]
class CencorRoute extends _i10.PageRouteInfo<void> {
  const CencorRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CencorRoute.name,
          initialChildren: children,
        );

  static const String name = 'CencorRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EntryView]
class EntryRoute extends _i10.PageRouteInfo<void> {
  const EntryRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EntryRoute.name,
          initialChildren: children,
        );

  static const String name = 'EntryRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FieldDetailView]
class FieldDetailRoute extends _i10.PageRouteInfo<void> {
  const FieldDetailRoute({List<_i10.PageRouteInfo>? children})
      : super(
          FieldDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'FieldDetailRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginView]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainView]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileView]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SensorResultView]
class SensorResultRoute extends _i10.PageRouteInfo<SensorResultRouteArgs> {
  SensorResultRoute({
    _i11.Key? key,
    required List<String> names,
    required int fieldId,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SensorResultRoute.name,
          args: SensorResultRouteArgs(
            key: key,
            names: names,
            fieldId: fieldId,
          ),
          initialChildren: children,
        );

  static const String name = 'SensorResultRoute';

  static const _i10.PageInfo<SensorResultRouteArgs> page =
      _i10.PageInfo<SensorResultRouteArgs>(name);
}

class SensorResultRouteArgs {
  const SensorResultRouteArgs({
    this.key,
    required this.names,
    required this.fieldId,
  });

  final _i11.Key? key;

  final List<String> names;

  final int fieldId;

  @override
  String toString() {
    return 'SensorResultRouteArgs{key: $key, names: $names, fieldId: $fieldId}';
  }
}
