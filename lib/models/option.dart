import 'package:flutter/foundation.dart';

import '../utils/data.dart';

class Options with ChangeNotifier {
  late List<Option> _options;

  List<Option> get options => _options;

  void set_options(List<Option> options) {
    _options = options;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  void switch_etat_option(String nom_option, bool etat){
    int index = _options.indexWhere((_o) => _o.nom == nom_option);
    _options[index].setEtat(etat);
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }
}