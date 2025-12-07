import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/view/add_cencor_view.dart';
import 'package:cookers_app/view/cencor_view.dart';
import 'package:cookers_app/view/dashboard_view.dart';
import 'package:cookers_app/view/entry_view.dart';
import 'package:cookers_app/view/field_detail_view.dart';
import 'package:cookers_app/view/home_view.dart';
import 'package:cookers_app/view/login_view.dart';
import 'package:cookers_app/view/main_view.dart';
import 'package:cookers_app/view/profile_view.dart';
import 'package:cookers_app/view/sensor_results_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'auto_router.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: EntryRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: MainRoute.page,
          //initial: true,
          path: '/main',
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: CencorRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: AddCencorRoute.page,
          path: '/add-sensor',
        ),
        AutoRoute(
          page: FieldDetailRoute.page,
          path: '/fieldDetail',
        ),
        AutoRoute(
          page: SensorResultRoute.page,
          path: '/sensorResult',
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: '/dashboard',
        ),
      ];
}
