import 'package:assessment/base/app/config/environment_config.dart';
import 'package:assessment/base/di/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:upgrader/upgrader.dart';
import '../routers/router.gr.dart' as router;

/// This widget is the root of your application.
class Recrave extends StatelessWidget {
  Recrave({this.config = EnvironmentConfig.prod, Key? key}) : super(key: key);

  final EnvironmentConfig config;
  final _router = router.Router();

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: AppDependencies.of(context, config).providers,
        //providers: MockAppDependencies.of(context, config).providers,
        child: _MyMaterialApp(_router),
      );
}

/// Wrapper around the MaterialApp widget to provide additional functionality
/// accessible throughout the app (such as App-level dependencies, Firebase
/// services, etc).
class _MyMaterialApp extends StatefulWidget {
  const _MyMaterialApp(this._router);

  final router.Router _router;

  @override
  __MyMaterialAppState createState() => __MyMaterialAppState();
}

class __MyMaterialAppState extends State<_MyMaterialApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, _) => ResponsiveWrapper.builder(
          UpgradeAlert(
            child: MaterialApp.router(
              title: 'app',
              // localizationsDelegates: const [
              //   AppLocalizations.delegate,
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              // ],
              // supportedLocales: AppLocalizations.supportedLocales,
              routeInformationParser: widget._router.defaultRouteParser(),
              routerDelegate: widget._router.delegate(
                navigatorObservers: () => [],
              ),
              debugShowCheckedModeBanner: false,
            ),
          ),
          maxWidth: 500,
          minWidth: 350,
          defaultScale: false,
          breakpoints: [
            // const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.resize(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.resize(2460, name: '4K'),
          ],
        ),
      );
}
