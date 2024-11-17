import 'package:flutter/foundation.dart';

class Membre_Equipe with ChangeNotifier {
  String _nom = "";
  String _image = "";

  String get nom => _nom;
  String get image => _image;

  void updateNom(String nom) {
    _nom = nom;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void updateImage(String src) {
    _image = src;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }
}