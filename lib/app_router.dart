
import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyHomeRoute.page),
    AutoRoute(page: MyProfileRoute.page),
    AutoRoute(page: MyNotificationRoute.page),
  ];
}