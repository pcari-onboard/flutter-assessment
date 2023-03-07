import 'package:flutter/services.dart';

const platform = MethodChannel('samples.flutter.dev/battery');

Future<void> openEmailApp() async {
  try {
    final int result = await platform.invokeMethod('openEmailApp');
  } on PlatformException catch (e) {
    print(e);
  }
}
