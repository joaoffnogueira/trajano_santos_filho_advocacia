import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trajano S. Filho Advocacia',
      theme: ThemeData(
        primaryColor: Colors.cyan[700],
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

/* class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
} */

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.cyan[700],
      textStyle: const TextStyle(fontSize: 20),
      fixedSize: Size.fromWidth(300)
    );
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
        backgroundColor: Colors.cyan[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/images/logo.png", width: 300),
            ElevatedButton.icon(
              icon: Icon(Icons.account_circle_outlined),
              label: const Text('Sobre'),
              style: style,
              onPressed: () {
                Navigator.push(
                    context,
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
              }},
          ),
            ElevatedButton.icon(
              icon: Icon(Icons.business_outlined),
              label: const Text('Tahech Advogados'),
            style: style,
            onPressed: () {launch('https://tahech.com/');},
          ),
            ElevatedButton.icon(
              icon: Icon(Icons.person_add_outlined),
              label: const Text('LindekIn'),
            style: style,
            onPressed: () {launch('https://www.linkedin.com/in/trajano-santos-filho-6b9314115/');},
          ),
            ElevatedButton.icon(
              icon: Icon(Icons.gavel_outlined),
              label: const Text('JusBrasil'),
            style: style,
            onPressed: () {launch('https://trjno.jusbrasil.com.br/');},
          ),
            ElevatedButton.icon(
              icon: Icon(Icons.badge_outlined),
              label: const Text('Currículo Lattes'),
            style: style,
            onPressed: () {launch('http://lattes.cnpq.br/4510844659930215');},
          ),
            ElevatedButton.icon(
              icon: Icon(Icons.email_outlined),
              label: const Text('E-mail'),
            style: style,
            onPressed: () {launch('mailto:contato@trajanoadv.info?Subject=Contato%20App');},
          )],
        ),
      ),
    );
  }
}
