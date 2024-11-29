import 'package:flutter/foundation.dart';

class Utils with ChangeNotifier {
  int _indexPage = 0;
  int _indexDate = 0;
  DateTime _dateActuelle = DateTime.now();

  int get indexPage => _indexPage;
  int get indexDate => _indexDate;
  DateTime get dateActuelle => _dateActuelle;

  void updateIndexPage(int index) {
    _indexPage = index;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void updateIndexDate(int index) {
    _indexDate = index;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void updateDate(DateTime date) {
    _dateActuelle = date;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }
}
