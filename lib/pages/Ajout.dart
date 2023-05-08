import 'package:flutter/material.dart';
import 'package:quizz/question.dart';

class Ajout extends StatefulWidget {
  const Ajout({super.key});

  @override
  State<Ajout> createState() => _AjoutState();
}

class _AjoutState extends State<Ajout> {
  final GlobalKey<FormState> login = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prixController = TextEditingController();
  final imgUrlController = TextEditingController();
  final quantityPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: login,
        child: _Ajout(context),
      ),
      key: UniqueKey(),
    );
  }

  Widget _Ajout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un article "),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: Text(
                    "Ajouter un article",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 255, 0, 0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: nomController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom',
                      hintText: 'Entrez un Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un nom d'articles";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: prixController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Prix',
                      hintText: 'Entrez un prix'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer une prix";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: imgUrlController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'image',
                      hintText: 'Entrez une image'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer une image";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: quantityPController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'quantité',
                      hintText: 'Entrez une quantité'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer une quantité";
                    }
                    return null;
                  },
                ),
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 250,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      if (login.currentState!.validate()) {
                        Produit.ajout(
                            context,
                            nomController.text,
                            prixController.text,
                            imgUrlController.text,
                            quantityPController.text);
                      }
                    },
                    child: const Text("Validez",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white)),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
