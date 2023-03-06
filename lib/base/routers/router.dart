// For every changes made in router, run the below command:
// `flutter pub run build_runner build --delete-conflicting-outputs`

import 'package:assessment/presentation/pages/my_contacts/my_contacts_page.dart';
import 'package:assessment/presentation/pages/my_contacts/my_contacts_wrapper.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(
      path: 'welcome',
      page: MyContactsWrapper,
      initial: true,
      children: [
        MaterialRoute(path: '', page: UserPage),
      ],
    ),
    // MaterialRoute(
    //   initial: true,
    //   name: 'MainRouter',
    //   path: '/',
    //   page: MainHomePage,
    //   children: [
    //     AutoRoute(
    //       initial: true,
    //       path: 'home',
    //       name: 'HomeRouter',
    //       page: EmptyRouterPage,
    //       children: [
    //         MaterialRoute(path: '', page: HomePage),
    //         RedirectRoute(path: '*', redirectTo: ''),
    //       ],
    //     ),
    //   ],
    // ),
  ],
)
class $Router {}
