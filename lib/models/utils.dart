import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../utils/data.dart';

class Utils with ChangeNotifier {
  int _indexPage = 0;
  int _indexDate = 0;
  DateTime _dateActuelle = DateTime.now();
  int indexDateActuelle = DateTime.now().weekday;

  int get indexPage => _indexPage;
  int get indexDate => _indexDate;
  DateTime get dateActuelle => _dateActuelle;
  List<Creneau> creneaux = [];


  void genererCreneaux() {
    // On utilise le addPostFrameCallback pour garantir que le notifyListeners()
    // se produit après la construction du widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<Creneau> _creneaux = [];

      DateTime _ouverture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[this.indexDateActuelle]]?["Ouverture"][0].hour,
        institut.horaires[joursSemaine[this.indexDateActuelle]]?["Ouverture"][0].minute,
      );

      DateTime _fermeture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[indexDateActuelle]]?["Ouverture"][1].hour,
        institut.horaires[joursSemaine[indexDateActuelle]]?["Ouverture"][1].minute,
      );

      // Génération des créneaux
      DateTime prochainCreneau = _ouverture;
      while (prochainCreneau.isBefore(_fermeture)) {
        _creneaux.add(Creneau(
          date: DateTime(
            dateActuelle.year,
            dateActuelle.month,
            dateActuelle.day,
            00,
            00, // C'est un exemple, adaptez-le selon votre besoin
          ),
          etat: Etat.DISPONIBLE, // Par défaut, tous les créneaux sont DISPONIBLES
          creneau: prochainCreneau,
        ));

        prochainCreneau = prochainCreneau.add(Duration(minutes: 30));
      }

      // Mettre à jour les créneaux et notifier les écouteurs
      creneaux = _creneaux;
      notifyListeners();
    });
  }


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

  void updateIndexDateActuelle(int index) {
    indexDateActuelle = index;
    notifyListeners(); // Notifie les widgets qui écoutent ce modèle
  }
}
