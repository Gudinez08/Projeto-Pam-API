import 'dart:convert';
import 'package:api_filmes/drama.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp (title: "App",
      home: MainApp(),));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAPP createState() => MainAPP();

}

class MainAPP extends State<MainApp> {



List<Drama> filmes =List.empty();                                      
int total = 0;
 Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/filmes_drama.json');
     Iterable data = await json.decode(response);
    filmes =  List<Drama>.from(data.map((model)=> Drama.fromJson(model)));
    total = filmes.length;
    setState(() {
      filmes;
      total;
    });
}

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: GridView.count(
          crossAxisCount: 1,
          children: List.generate(filmes.length, (index) {
            return Center(
                child: FilmeCard(opcao: filmes[index]),
              );
          })
        )
    
        @override
           create class FilmeCard extends StatelessWidget {
  const FilmeCard({Key key, this.opcao}) : super(key: key);
  final Drama opcao;
  
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context)
.textTheme.display1;
        return Card(
          color: Colors.white,
          child: Center(
             child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                Text(opcao.titulo, style: textStyle),
          ]
        ),
      )
    );
  }
          }
      
        )
      )  ;
    

}

}
