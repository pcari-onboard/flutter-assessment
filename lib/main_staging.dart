import 'package:flutter/material.dart';

import 'base/app/app.dart';
import 'base/app/config/environment_config.dart';

void main() async {
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.dev/testing/ for more info.
  // enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();

  // Must ensure import is correct flavor
  // await safeRun(() =>
  //     Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform));

  // Configure global app tools before launching the app
  // await configureApp();

  runApp(App(config: EnvironmentConfig.staging));
}
