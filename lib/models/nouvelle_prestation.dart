import 'package:flutter/foundation.dart';

class Nouvelle_Prestation with ChangeNotifier {
  String _nom = "";
  String _categorie = "";
  double _prix = 0;
  String _duree = "";
  String _description = "";
  bool _a_domicile = false;

  String get nom => _nom;
  String get categorie => _categorie;
  String get duree => _duree;
  double get prix => _prix;
  String get description => _description;
  bool get a_domicile => _a_domicile;

  void update_nom(String nom) {
    _nom = nom;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void update_description(String description) {
    _description = description;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void update_categorie(String categorie) {
    _categorie = categorie;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void update_prix(double prix) {
    _prix = prix;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void update_duree(String duree) {
    _duree = duree;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void update_etat_domicile(bool etat) {
    _a_domicile = etat;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }
}