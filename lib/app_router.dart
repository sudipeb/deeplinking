
import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyProfileRoute.page,initial: true,),
    AutoRoute(page: MyHomeRoute.page, ),
    AutoRoute(page: MyNotificationRoute.page,),
  ];

}