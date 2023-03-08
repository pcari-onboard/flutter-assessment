import 'package:flutter/services.dart';

const platform = MethodChannel('samples.flutter.dev/battery');

Future<void> openEmailApp(
    {String? email, String? subject, String? message}) async {
  try {
    final int result = await platform.invokeMethod('openEmailApp', {
      "email": email,
      "subject": subject,
      "message": message,
    });
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
