import 'package:flutter/material.dart';
import 'package:waterproject3/business_logic/noti_class.dart';

class WaterSelection extends StatelessWidget {
  final Function(int) onButtonPressed;

  NotificationServices notificationServices = NotificationServices();

  WaterSelection({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Escolha a quantidade de copos de água'),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                onButtonPressed(125);
                notificationServices.intakeNotification();
                notificationServices.scheduleNotification();
                notificationServices.repeatNotification();
                notificationServices.scheduleNotificationOnce1hour(scheduledDate: DateTime.now());
                notificationServices.scheduleNotificationOnce3hour(scheduledDate: DateTime.now());
                Navigator.of(context).pop();
              },
              child: Container(child: Column(
                children: [
                  Text('1/2 - 125 ml'),
                ],
              )),
            ),
            ElevatedButton(
              onPressed: () {
                onButtonPressed(250);
                notificationServices.intakeNotification();
                notificationServices.scheduleNotification();
                notificationServices.repeatNotification();
                notificationServices.scheduleNotificationOnce1hour(scheduledDate: DateTime.now());
                notificationServices.scheduleNotificationOnce3hour(scheduledDate: DateTime.now());
                Navigator.of(context).pop();
              },
              child: Text('1 - 250 ml'),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                onButtonPressed(375);
                notificationServices.intakeNotification();
                notificationServices.scheduleNotification();
                notificationServices.repeatNotification();
                notificationServices.scheduleNotificationOnce1hour(scheduledDate: DateTime.now());
                notificationServices.scheduleNotificationOnce3hour(scheduledDate: DateTime.now());
                Navigator.of(context).pop();
              },
              child: Text('1,5 - 375 ml'),
            ),
            ElevatedButton(
              onPressed: () {
                onButtonPressed(500);
                notificationServices.intakeNotification();
                notificationServices.scheduleNotification();
                notificationServices.repeatNotification();
                notificationServices.scheduleNotificationOnce1hour(scheduledDate: DateTime.now());
                notificationServices.scheduleNotificationOnce3hour(scheduledDate: DateTime.now());
                Navigator.of(context).pop();
              },
              child: Text('2 - 500 ml'),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                onButtonPressed(750);
                notificationServices.intakeNotification();
                notificationServices.scheduleNotification();
                notificationServices.repeatNotification();
                notificationServices.scheduleNotificationOnce1hour(scheduledDate: DateTime.now());
                notificationServices.scheduleNotificationOnce3hour(scheduledDate: DateTime.now());
                Navigator.of(context).pop();
              },
              child: Text('2,5 - 750 ml'),
            ),
            ElevatedButton(
              onPressed: () {
                onButtonPressed(1000);
                notificationServices.intakeNotification();
                notificationServices.scheduleNotification();
                notificationServices.repeatNotification();
                notificationServices.scheduleNotificationOnce1hour(scheduledDate: DateTime.now());
                notificationServices.scheduleNotificationOnce3hour(scheduledDate: DateTime.now());
                Navigator.of(context).pop();
              },
              child: Text('4 - 1 l'),
            ),
          ],
        ),
      ],
    );
  }
}
