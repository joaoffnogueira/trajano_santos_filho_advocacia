import 'package:flutter/material.dart';

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
      ),
      home: MyHomePage(title: 'Trajano S. Filho Advocacia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.cyan[700],
      textStyle: const TextStyle(fontSize: 20),
      fixedSize: Size.fromWidth(300)
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/images/logo.png", width: 300),
            ElevatedButton(
              style: style,
              onPressed: () {},
              child: const Text('Sobre'),
            ),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('WhatsApp'),
          ),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Tahech Advogados'),
          ),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('LindekIn'),
          ),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('JusBrasil'),
          ),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Currículo Lattes'),
          ),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('E-mail'),
          )],
        ),
      ),
    );
  }
}
