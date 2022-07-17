import 'package:flutter/material.dart';
import 'package:trajano_santos_filho_advocacia/screens/about_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final ButtonStyle buttonStyle = TextButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), fixedSize: Size.fromWidth(300));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/images/logo.png", width: 300),
            TextButton.icon(
              icon: Icon(Icons.account_circle_outlined),
              label: const Text('Sobre'),
              style: buttonStyle,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.chat_outlined),
              label: const Text('WhatsApp'),
              style: buttonStyle,
              onPressed: () async {
                var whatsappUrl = "whatsapp://send?phone=+5542998535765";
                var url = "https://wa.me/5542998535765";
                if (await canLaunchUrlString(whatsappUrl)) {
                  launchUrlString(whatsappUrl);
                } else {
                  launchUrlString(url);
                }
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.person_add_outlined),
              label: const Text('LinkedIn'),
              style: buttonStyle,
              onPressed: () {
                launchUrlString(
                    'https://www.linkedin.com/in/trajano-santos-filho-6b9314115/');
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.badge_outlined),
              label: const Text('Currículo Lattes'),
              style: buttonStyle,
              onPressed: () {
                launchUrlString('http://lattes.cnpq.br/4510844659930215');
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.email_outlined),
              label: const Text('E-mail'),
              style: buttonStyle,
              onPressed: () {
                launchUrlString(
                    'mailto:contato@trajanoadv.info?Subject=Contato%20App');
              },
            )
          ],
        ),
      ),
    );
  }
}
