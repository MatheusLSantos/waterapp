import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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
        "Notificações instantâneas",
      importance: Importance.max,
      priority: Priority.max
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );
    await flutterLocalNotificationsPlugin.show(0, 'Opa! Parece que alguém bebeu água', 'Continue assim!', notificationDetails);
  }

  void scheduleNotification()async{
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "channelId",
        "Lembretes padrão",
        importance: Importance.max,
        priority: Priority.max
    );
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'Hora de beber água!', 'Já faz um tempo né?', RepeatInterval.weekly, notificationDetails);
  }

  Future<void> repeatNotification() async {

    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        "channelId", "Lembretes aleatórios",);
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

    // Create a list of greetings
    List<String> greetings = [
      "Oi!",
      "Opa!",
      "Olá!",
      "Iaee!",
      "Tudo bem?",
      "Sabe no que eu tava pensando?",
      "Então...",
      ":)",
      ">:(",
      "Olha só!",
      "aiai...",
      "Tá calor né?",
      "Abre aqui!",
      "Ei!",
    ];

    // Create a list of daily check-in messages
    List<String> checkInMessages = [
      "Não crie expectativas, beba água. Porque se nada der certo, pelo menos você se hidratou.",
      "Sabia que é melhor uma pedra no seu caminho do que duas nos seus rins? BEBA ÁGUA!",
      "Tomar um chazinho para se acalmar, pois a água está acabando...",
      "Não há vida sem água. Porque sem água não há café, e sem café eu mato todo mundo!",
      "Você não é um cacto, beba água!",
      "Para tudo o que você tá fazendo e vá beber água! Eu me preocupo com você",
      "Quando você quer algo e não sabe o quê, beba água! É sempre água...",
      "@ Só te marquei aqui pra te lembrar de beber água!",
      "Nesse calor, hidrate-se! Água é vida.",
      "Se acabar a água no Brasil eu vou pra algum país que neva, porque um dia a neve vai descongelar e lá vai ter água.",
      "Por quê a água foi presa? Porque matou a sede... KKKKKKKKKKKKKKKKKKKKKK",
      "Beba muita água! Sua mente, sua pele, seu cabelo e seu corpo irão agradecer",
      "Faça um grande favor a si. BEBA ÁGUA!",
      "Beber água é o melhor tratamento de beleza que existe!",
      "Lembre de beber bastante água!",
      "Se não beber água 'nóis faz pedrinha'",
      "Beba água, ela aumenta a produtividade!",
      "PARADO! Já bebeu água hoje?",
      "Sai da internet e vai se hidratar!",
      "Aproveite enquanto isso for apenas um aviso.",
    ];

    int id = 100;

    // Create a random number generator
    final rng = Random();

    // Pick a random greeting
    String randomGreeting = greetings[rng.nextInt(greetings.length)];

    // Pick a random check-in message
    String randomCheckInMessage = checkInMessages[rng.nextInt(checkInMessages.length)];

    await flutterLocalNotificationsPlugin.periodicallyShow(
      id++,
      randomGreeting,
      randomCheckInMessage,
      RepeatInterval.daily,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

    );
  }


  Future<void> scheduleNotificationOnce1hour(
      {required DateTime scheduledDate}) async {
    final oneHourFromNow = DateTime.now().add(Duration(hours: 1));
    final scheduledTime = scheduledDate.isBefore(oneHourFromNow)
        ? oneHourFromNow
        : scheduledDate;

    // Create a list of greetings
    List<String> greetings = [
      "Oi!",
      "Opa!",
      "Olá!",
      "Iaee!",
      "Tudo bem?",
      "Sabe no que eu tava pensando?",
      "Então...",
      ":)",
      ">:(",
      "Olha só!",
      "aiai...",
      "Tá calor né?",
      "Abre aqui!",
      "Ei!",
    ];

    // Create a list of daily check-in messages
    List<String> checkInMessages = [
      "Não crie expectativas, beba água. Porque se nada der certo, pelo menos você se hidratou.",
      "Sabia que é melhor uma pedra no seu caminho do que duas nos seus rins? BEBA ÁGUA!",
      "Tomar um chazinho para se acalmar, pois a água está acabando...",
      "Não há vida sem água. Porque sem água não há café, e sem café eu mato todo mundo!",
      "Você não é um cacto, beba água!",
      "Para tudo o que você tá fazendo e vá beber água! Eu me preocupo com você",
      "Quando você quer algo e não sabe o quê, beba água! É sempre água...",
      "@ Só te marquei aqui pra te lembrar de beber água!",
      "Nesse calor, hidrate-se! Água é vida.",
      "Se acabar a água no Brasil eu vou pra algum país que neva, porque um dia a neve vai descongelar e lá vai ter água.",
      "Por quê a água foi presa? Porque matou a sede... KKKKKKKKKKKKKKKKKKKKKK",
      "Beba muita água! Sua mente, sua pele, seu cabelo e seu corpo irão agradecer",
      "Faça um grande favor a si. BEBA ÁGUA!",
      "Beber água é o melhor tratamento de beleza que existe!",
      "Lembre de beber bastante água!",
      "Se não beber água 'nóis faz pedrinha'",
      "Beba água, ela aumenta a produtividade!",
      "PARADO! Já bebeu água hoje?",
      "Sai da internet e vai se hidratar!",
      "Aproveite enquanto isso for apenas um aviso.",
    ];

    int id = 1000;

    // Create a random number generator
    final rng = Random();

    // Pick a random greeting
    String randomGreeting = greetings[rng.nextInt(greetings.length)];

    // Pick a random check-in message
    String randomCheckInMessage = checkInMessages[rng.nextInt(checkInMessages.length)];

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id++,
      randomGreeting,
      randomCheckInMessage,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
        ),
      ),
      androidAllowWhileIdle: true,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }


  Future<void> scheduleNotificationOnce3hour(
      {required DateTime scheduledDate}) async {
    final threeHoursFromNow = DateTime.now().add(Duration(hours: 3));
    final scheduledTime = scheduledDate.isBefore(threeHoursFromNow)
        ? threeHoursFromNow
        : scheduledDate;

    // Create a list of greetings
    List<String> greetings = [
      "Oi!",
      "Opa!",
      "Olá!",
      "Iaee!",
      "Tudo bem?",
      "Sabe no que eu tava pensando?",
      "Então...",
      ":)",
      ">:(",
      "Olha só!",
      "aiai...",
      "Tá calor né?",
      "Abre aqui!",
      "Ei!",
    ];

    // Create a list of daily check-in messages
    List<String> checkInMessages = [
      "Não crie expectativas, beba água. Porque se nada der certo, pelo menos você se hidratou.",
      "Sabia que é melhor uma pedra no seu caminho do que duas nos seus rins? BEBA ÁGUA!",
      "Tomar um chazinho para se acalmar, pois a água está acabando...",
      "Não há vida sem água. Porque sem água não há café, e sem café eu mato todo mundo!",
      "Você não é um cacto, beba água!",
      "Para tudo o que você tá fazendo e vá beber água! Eu me preocupo com você",
      "Quando você quer algo e não sabe o quê, beba água! É sempre água...",
      "@ Só te marquei aqui pra te lembrar de beber água!",
      "Nesse calor, hidrate-se! Água é vida.",
      "Se acabar a água no Brasil eu vou pra algum país que neva, porque um dia a neve vai descongelar e lá vai ter água.",
      "Por quê a água foi presa? Porque matou a sede... KKKKKKKKKKKKKKKKKKKKKK",
      "Beba muita água! Sua mente, sua pele, seu cabelo e seu corpo irão agradecer",
      "Faça um grande favor a si. BEBA ÁGUA!",
      "Beber água é o melhor tratamento de beleza que existe!",
      "Lembre de beber bastante água!",
      "Se não beber água 'nóis faz pedrinha'",
      "Beba água, ela aumenta a produtividade!",
      "PARADO! Já bebeu água hoje?",
      "Sai da internet e vai se hidratar!",
      "Aproveite enquanto isso for apenas um aviso.",
    ];

    int id = 10000;

    // Create a random number generator
    final rng = Random();

    // Pick a random greeting
    String randomGreeting = greetings[rng.nextInt(greetings.length)];

    // Pick a random check-in message
    String randomCheckInMessage = checkInMessages[rng.nextInt(checkInMessages.length)];

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id++,
      randomGreeting,
      randomCheckInMessage,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
        ),
      ),
      androidAllowWhileIdle: true,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

}