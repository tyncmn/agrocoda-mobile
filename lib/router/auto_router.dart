import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/router/auto_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
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
              page: MapRoute.page,
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
      ];
}
