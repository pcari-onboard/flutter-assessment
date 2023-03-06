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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/pages/my_contacts/my_contacts_page.dart' as _i2;
import '../../presentation/pages/my_contacts/my_contacts_wrapper.dart' as _i1;

class Router extends _i3.RootStackRouter {
  Router([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MyContactsWrapper.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyContactsWrapper(),
      );
    },
    UserRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.UserPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'welcome',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          MyContactsWrapper.name,
          path: 'welcome',
          children: [
            _i3.RouteConfig(
              UserRoute.name,
              path: '',
              parent: MyContactsWrapper.name,
            )
          ],
        ),
      ];
}

/// generated route for
/// [_i1.MyContactsWrapper]
class MyContactsWrapper extends _i3.PageRouteInfo<void> {
  const MyContactsWrapper({List<_i3.PageRouteInfo>? children})
      : super(
          MyContactsWrapper.name,
          path: 'welcome',
          initialChildren: children,
        );

  static const String name = 'MyContactsWrapper';
}

/// generated route for
/// [_i2.UserPage]
class UserRoute extends _i3.PageRouteInfo<void> {
  const UserRoute()
      : super(
          UserRoute.name,
          path: '',
        );

  static const String name = 'UserRoute';
}
