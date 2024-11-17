import 'package:flutter/foundation.dart';

class Utils with ChangeNotifier {
  int _indexPage = 0;

  int get indexPage => _indexPage;

  void updateIndexPage(int index) {
    _indexPage = index;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }
}
