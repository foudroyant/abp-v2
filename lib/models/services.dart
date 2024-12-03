import 'package:flutter/foundation.dart';

import '../utils/data.dart';

class Services_Model with ChangeNotifier {
  late List<Prestation> prestations;

  Services_Model({required prestations}){
    this.prestations = prestations;
  }


  void update_prestation(Prestation prestation, int index) {
    prestations[index] = prestation;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }
}