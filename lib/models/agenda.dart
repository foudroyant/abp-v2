import 'package:flutter/foundation.dart';

import '../utils/data.dart';

class AgendaProvider with ChangeNotifier {
  late List<Creneau> agendaJour;



  void update_creneaux_jour(List<Creneau> creneaux) {
    agendaJour = creneaux;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }

  update_creaneau(Creneau creneau, int index){
    agendaJour[index] = creneau;
    notifyListeners();
  }
}