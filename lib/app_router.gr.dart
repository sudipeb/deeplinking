// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:deeplinking/home_page.dart' as _i1;
import 'package:deeplinking/notification_page.dart' as _i2;
import 'package:deeplinking/profile_page.dart' as _i3;

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<void> {
  const MyHomeRoute({List<_i4.PageRouteInfo>? children})
    : super(MyHomeRoute.name, initialChildren: children);

  static const String name = 'MyHomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.MyHomePage();
    },
  );
}

/// generated route for
/// [_i2.MyNotificationPage]
class MyNotificationRoute extends _i4.PageRouteInfo<void> {
  const MyNotificationRoute({List<_i4.PageRouteInfo>? children})
    : super(MyNotificationRoute.name, initialChildren: children);

  static const String name = 'MyNotificationRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.MyNotificationPage();
    },
  );
}

/// generated route for
/// [_i3.MyProfilePage]
class MyProfileRoute extends _i4.PageRouteInfo<void> {
  const MyProfileRoute({List<_i4.PageRouteInfo>? children})
    : super(MyProfileRoute.name, initialChildren: children);

  static const String name = 'MyProfileRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.MyProfilePage();
    },
  );
}
