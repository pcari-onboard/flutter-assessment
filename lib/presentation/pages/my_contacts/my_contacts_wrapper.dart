import 'package:assessment/presentation/pages/my_contacts/di/my_contacts_dependencies.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyContactsWrapper extends StatefulWidget {
  const MyContactsWrapper({Key? key}) : super(key: key);

  @override
  State<MyContactsWrapper> createState() => _MyContactsWrapperState();
}

class _MyContactsWrapperState extends State<MyContactsWrapper> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        // All child pages have access to ShopDependencies (repositories, blocs etc),
        // check [router.dart] to which pages who has access
        providers: MyContactsDependencies.of(context).providers,
        // Since we are accessing the provider immediately, we must use builder
        // to provide new context that contains the provider
        builder: (context, child) => _init(context));
  }

  AutoRouter _init(BuildContext context) {
    return const AutoRouter();
  }
}
