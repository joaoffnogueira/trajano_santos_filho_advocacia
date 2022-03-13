import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trajano S. Filho Advocacia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan[800],
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
        textTheme: const TextTheme(
          headline6: TextStyle(fontFamily: 'Montserrat'),
          bodyText2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: MyHomePage(title: 'Trajano S. Filho Advocacia'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: '@mipmap/ic_launcher',
                // other properties...
              ),
            ));
      }
    });

    void _handleMessage(RemoteMessage message) {
      if (message.data['link'] != null) {
        launch('${message.data['link']}');
      }
    }

    Future<void> setupInteractedMessage() async {
      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        _handleMessage(initialMessage);
      }

      // Also handle any interaction when the app is in the background via a
      // Stream listener
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    }

    setupInteractedMessage();
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: Colors.cyan[800],
        textStyle: const TextStyle(fontSize: 20),
        fixedSize: Size.fromWidth(300));
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
        backgroundColor: Colors.cyan[800],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("assets/images/logo.png", width: 300),
              ElevatedButton.icon(
                icon: Icon(Icons.account_circle_outlined),
                label: const Text('Sobre'),
                style: style,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.chat_outlined),
                label: const Text('WhatsApp'),
                style: style,
                onPressed: () async {
                  var whatsappUrl = "whatsapp://send?phone=+5542998535765";
                  var url = "https://wa.me/5542998535765";
                  if (await canLaunch(whatsappUrl)) {
                    launch(whatsappUrl);
                  } else {
                    launch(url);
                  }
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.business_outlined),
                label: const Text('Tahech Advogados'),
                style: style,
                onPressed: () {
                  launch('https://tahech.com/');
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.person_add_outlined),
                label: const Text('LinkedIn'),
                style: style,
                onPressed: () {
                  launch(
                      'https://www.linkedin.com/in/trajano-santos-filho-6b9314115/');
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.gavel_outlined),
                label: const Text('JusBrasil'),
                style: style,
                onPressed: () {
                  launch('https://trjno.jusbrasil.com.br/');
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.badge_outlined),
                label: const Text('Currículo Lattes'),
                style: style,
                onPressed: () {
                  launch('http://lattes.cnpq.br/4510844659930215');
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.email_outlined),
                label: const Text('E-mail'),
                style: style,
                onPressed: () {
                  launch(
                      'mailto:contato@trajanoadv.info?Subject=Contato%20App');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
