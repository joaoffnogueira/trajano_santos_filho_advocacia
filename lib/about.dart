import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trajano S. Filho Advocacia"),
        backgroundColor: Colors.cyan[700],
      ),
      body: Center(
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Image.asset("assets/images/foto.webp", width: 300),
              Text(
                'Olá!',
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Me chamo Trajano, sou advogado (OAB/PR 85.417) e desde 2017 atuo no âmbito consultivo e contencioso, em favor de empresas nas suas relações com a administração pública, com parceiros comerciais e com seus consumidores.',
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              Text(
                'Prezo pelo rigor técnico, sustentabilidade, ética e eficiência em todos os projetos de que faço parte, empregando técnicas de legal design na busca por soluções criativas e inteligentes para as necessidades dos meus clientes.',
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              Text(
                'Ofereço atendimento virtual para todo o Brasil, sobretudo nas áreas de:',
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              ListTile(
                leading: Icon(Icons.arrow_right_rounded),
                title: Text('Contratos;'),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right_rounded),
                title: Text('Licitações;'),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right_rounded),
                title: Text('LGPD e Proteção de Dados;'),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right_rounded),
                title: Text('Comércio Eletrônico;'),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right_rounded),
                title: Text('Relações de Consumo;'),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right_rounded),
                title: Text('Inovação e Tecnologia;'),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right_rounded),
                title: Text('Propriedade Intelectual, e;'),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right_rounded),
                title: Text('Startups.'),
              ),
              Text(
                'Se quiser me conhecer melhor, minha rotina profissional e produção técnica, dê uma olhada nos demais links da página inicial. Além dos atalhos para as redes sociais, você tem acesso à minha página no JusBrasil e ao meu Currículo Lattes.',
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              Text(
                'Se precisar de ajuda, terei a maior satisfação em atendê-lo(a)!',
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              Text(
                'Agende agora mesmo uma consulta.',
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
            ]),
      ),
    );
  }
}
