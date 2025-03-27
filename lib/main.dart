import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Filmes de Drama')),
        body: const FilmeList(),
      ),
    );
  }
}

class FilmeList extends StatefulWidget {
  const FilmeList({super.key});

  @override
  _FilmeListState createState() => _FilmeListState();
}

class _FilmeListState extends State<FilmeList> {
  List<dynamic> filmes = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    final String jsonString = await rootBundle.loadString('assets/filmes_drama.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      filmes = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return filmes.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(filme["titulo"]),
                subtitle: Text(
                  "Ano: ${filme["ano"]} | Descrição: ${filme["descricao"]}  | Diretor: ${filme["diretor"]} ",
                ),
              ),
            );
          },
        );
  }
}
