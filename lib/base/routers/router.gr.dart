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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../presentation/pages/my_contacts/my_contacts_page.dart' as _i3;
import '../../presentation/pages/my_contacts/my_contacts_wrapper.dart' as _i1;
import '../../presentation/pages/profile/profile_page.dart' as _i4;
import '../../presentation/pages/profile/profile_wrapper.dart' as _i2;

class Router extends _i5.RootStackRouter {
  Router([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MyContactsWrapper.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MyContactsWrapper(),
      );
    },
    Profile.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ProfileWrapper(),
      );
    },
    UserRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.UserPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => ProfileRouteArgs(
                id: pathParams.optString('id'),
                isEdit: pathParams.optBool('isEdit'),
              ));
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProfilePage(
          id: args.id,
          key: args.key,
          isEdit: args.isEdit,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'contacts',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          MyContactsWrapper.name,
          path: 'contacts',
          children: [
            _i5.RouteConfig(
              UserRoute.name,
              path: '',
              parent: MyContactsWrapper.name,
            )
          ],
        ),
        _i5.RouteConfig(
          Profile.name,
          path: 'profile',
          children: [
            _i5.RouteConfig(
              ProfileRoute.name,
              path: ':id/:isEdit',
              parent: Profile.name,
            )
          ],
        ),
      ];
}

/// generated route for
/// [_i1.MyContactsWrapper]
class MyContactsWrapper extends _i5.PageRouteInfo<void> {
  const MyContactsWrapper({List<_i5.PageRouteInfo>? children})
      : super(
          MyContactsWrapper.name,
          path: 'contacts',
          initialChildren: children,
        );

  static const String name = 'MyContactsWrapper';
}

/// generated route for
/// [_i2.ProfileWrapper]
class Profile extends _i5.PageRouteInfo<void> {
  const Profile({List<_i5.PageRouteInfo>? children})
      : super(
          Profile.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'Profile';
}

/// generated route for
/// [_i3.UserPage]
class UserRoute extends _i5.PageRouteInfo<void> {
  const UserRoute()
      : super(
          UserRoute.name,
          path: '',
        );

  static const String name = 'UserRoute';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i5.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    String? id,
    _i6.Key? key,
    bool? isEdit,
  }) : super(
          ProfileRoute.name,
          path: ':id/:isEdit',
          args: ProfileRouteArgs(
            id: id,
            key: key,
            isEdit: isEdit,
          ),
          rawPathParams: {
            'id': id,
            'isEdit': isEdit,
          },
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.id,
    this.key,
    this.isEdit,
  });

  final String? id;

  final _i6.Key? key;

  final bool? isEdit;

  @override
  String toString() {
    return 'ProfileRouteArgs{id: $id, key: $key, isEdit: $isEdit}';
  }
}
