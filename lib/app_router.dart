
import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyProfileRoute.page,path: "/profile",initial: true,),
    AutoRoute(page: MyHomeRoute.page, path: "/home"),
    AutoRoute(page: MyNotificationRoute.page,path: "/notification"),
  ];
}