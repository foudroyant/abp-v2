import 'package:flutter/foundation.dart';

class Genre_Type with ChangeNotifier {
  String _genre = "";
  String _type = "";

  String get genre => _genre;
  String get type => _type;

  void updateGenre(String genre) {
    _genre = genre;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void updateType(String type) {
    _type = type;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }
}