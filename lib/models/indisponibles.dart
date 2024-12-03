import 'package:flutter/foundation.dart';

import '../utils/data.dart';

class IndisponibleProvider with ChangeNotifier {
  List<Indisponible> indisponibles;

  IndisponibleProvider({required this.indisponibles});


  void add_indisponible(Indisponible indisponible) {
    indisponibles.add(indisponible);
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

}