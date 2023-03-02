// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../../presentation/pages/user_page.dart' as _i1;

class Router extends _i2.RootStackRouter {
  Router([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    UserRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.UserPage(),
      );
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          UserRoute.name,
          path: 'welcome',
        )
      ];
}

/// generated route for
/// [_i1.UserPage]
class UserRoute extends _i2.PageRouteInfo<void> {
  const UserRoute()
      : super(
          UserRoute.name,
          path: 'welcome',
        );

  static const String name = 'UserRoute';
}
