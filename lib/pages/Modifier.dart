import 'package:flutter/material.dart';
import 'package:quizz/question.dart';

class Modifier extends StatefulWidget {
  final int id;

  const Modifier({Key? key, required this.id}) : super(key: key);

  @override
  State<Modifier> createState() => _ModifierState();
}

class _ModifierState extends State<Modifier> {
  final GlobalKey<FormState> login = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prixController = TextEditingController();
  final imgUrlController = TextEditingController();
  final quantityPController = TextEditingController();

  late Future<List> _produit;

  @override
  void initState() {
    super.initState();
    // On récupère les informations de la question avec son id
    // passé en paramètre
    _produit = Produit.getQuestion(widget.id);
    _produit.then((value) => {
          // On pré-remplit le formulaire avec les données récupérer de l'API
          nomController.text = value[0]['nom'],
          prixController.text = value[0]['prix'],
          imgUrlController.text = value[0]['imgUrl'],
          quantityPController.text = value[0]['quantityP']
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: login,
        child: _Modifier(context),
      ),
      key: UniqueKey(),
    );
  }

  Widget _Modifier(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modification d'un article"),
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
                    "Modifier un article",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: nomController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'nom',
                      hintText: 'Entrez un nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un nom";
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
                      labelText: 'prix',
                      hintText: 'Entrez un prix'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un prix";
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
                      return "Veuillez rentrer une image ";
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
                      return "Veuillez rentrer une quantité ";
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
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      if (login.currentState!.validate()) {
                        Produit.Update(
                            context,
                            widget.id,
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
