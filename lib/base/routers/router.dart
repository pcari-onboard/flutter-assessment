// For every changes made in router, run the below command:
// `flutter pub run build_runner build --delete-conflicting-outputs`

import 'package:assessment/presentation/pages/my_contacts/my_contacts_page.dart';
import 'package:assessment/presentation/pages/my_contacts/my_contacts_wrapper.dart';
import 'package:assessment/presentation/pages/profile/profile_page.dart';
import 'package:assessment/presentation/pages/profile/profile_wrapper.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(
      path: 'contacts',
      page: MyContactsWrapper,
      initial: true,
      children: [
        MaterialRoute(path: '', page: UserPage),
      ],
    ),
    MaterialRoute(
      name: 'profile',
      path: 'profile',
      page: ProfileWrapper,
      children: [
        MaterialRoute(path: ':id/:isEdit', page: ProfilePage),
      ],
    ),
  ],
)
class $Router {}
