import 'package:flutter/material.dart';
import 'package:quizz/pages/Affichage.dart';
import 'package:quizz/pages/Ajout.dart';
import 'package:quizz/pages/Connexion.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  static const String _title = 'Quizz';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notre application de quizz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Connexion(),
        '/articles': (context) => const Affichage(),
        '/ajout': (context) => const Ajout(),
      },
    );
  }
}
