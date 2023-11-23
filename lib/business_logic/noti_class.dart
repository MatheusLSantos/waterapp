import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');

  void initialNotification ()async{
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void intakeNotification()async{
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "channelId",
        "channelName",
      importance: Importance.max,
      priority: Priority.max
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );
    await flutterLocalNotificationsPlugin.show(0, 'Opa! Parece que alguém bebeu água', 'Continue assim!', notificationDetails);
  }



}