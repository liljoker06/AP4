import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Produit {
  static String baseUrl = "http://localhost:3001";

  static Future<List> getAllProduit() async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/articles"));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Future<List> getQuestion(int id) async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/articles/$id"));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Login(BuildContext context, Email, Mdp) async {
    try {
      var connection = {"Email": Email, "Mdp": Mdp};
      var res = await http.post(
        Uri.parse("$baseUrl/connexion"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'Email': Email, 'Mdp': Mdp}),
      );
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/articles');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static ajout(BuildContext context, String theme, String question,
      String reponse) async {
    try {
      var res = await http.post(
        Uri.parse("$baseUrl/question"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'theme': theme,
          'question': question,
          'reponse': reponse
        }),
      );
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/liste');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Update(BuildContext context, int id, String theme, String question,
      String reponse) async {
    try {
      var res = await http.put(
        Uri.parse("$baseUrl/question/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'theme': theme,
          'question': question,
          'reponse': reponse,
          'id': id.toString()
        }),
      );
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/liste');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Delete(BuildContext context, int id) async {
    var res = await http.delete(Uri.parse('$baseUrl/question/$id'),
        body: id.toString());
    if (res.statusCode == 200) {
      Navigator.pushNamed(context, '/liste');
    } else {
      Navigator.pushNamed(context, '/');
    }
  }
}
