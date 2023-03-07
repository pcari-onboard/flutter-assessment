import 'package:flutter/services.dart';

const platform = MethodChannel('samples.flutter.dev/battery');

Future<void> openEmailApp() async {
  try {
    final int result = await platform.invokeMethod('openEmailApp');
  } on PlatformException catch (e) {
    print(e);
  }
}

Future<void> snedNotification({String? title, String? description}) async {
  try {
    await platform.invokeMethod(
        'sendNotification', {"title": title, "desc": description});
  } on PlatformException catch (e) {
    print(e);
  }
}

Future<void> createNotificationChannel() async {
  try {
    await platform.invokeMethod('createNotificationChannel');
  } on PlatformException catch (e) {
    print(e);
  }
}
