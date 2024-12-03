class Prestation {
  String nom;
  String description;
  bool a_domicile;
  double prix;
  String duree;
  String categorie;
  String type;

  Prestation({
    required this.nom,
    required this.description,
    required this.a_domicile,
    required this.prix,
    required this.duree,
    required this.categorie,
    required this.type,

  });

  String get le_nom => nom;
  String get la_description => description;
  String get la_duree => duree;
  double get la_prix => prix;
  bool get is_a_domicile => a_domicile;

  void setNom(String nom){
    this.nom = nom;
  }

  void seDescription(String description){
    this.description = description;
  }

  void setEtat(bool etat){this.a_domicile = etat;}

  void setPrix(double prix){this.prix = prix;}

  void setDuree(String duree){this.duree = duree;}
  void setCategorie(String categorie){this.categorie = categorie;}
  void setType(String type){this.type = type;}

}

class Option {
  String img;
  String nom;
  String duree;
  double prix;
  bool etat;

  Option({
    required this.img,
  required this.nom,
  required this.duree,
  required this.prix,
  required this.etat
});

  String get image => img;
  String get le_nom => nom;
  String get la_duree => duree;
  double get le_prix => prix;
  bool get l_etat => etat;

  void setEtat(bool etat){
    this.etat = etat;
  }
}

enum EtatDisponible { disponible, indisponible, hc, reserved, cancel }

enum Etat {
  DISPONIBLE,
  INDISPONIBLE,
  ANNULE,
  HC,
  RESERVE
}

class Creneau {
  // Propriétés privées
  DateTime _date;
  Etat _etat;
  DateTime _creneau;

  // Constructeur
  Creneau({
    required DateTime date,
    required Etat etat,
    required DateTime creneau,
  })  : _date = date,
        _etat = etat,
        _creneau = creneau;

  // Méthodes pour récupérer les valeurs
  DateTime get date => _date;
  Etat get etat => _etat;
  DateTime get creneau => _creneau;

  // Méthodes pour modifier les valeurs
  set date(DateTime newDate) {
    _date = newDate;
  }

  set etat(Etat newEtat) {
    _etat = newEtat;
  }

  set creneau(DateTime newCreneau) {
    _creneau = newCreneau;
  }

  // Méthode pour afficher les informations du créneau
  @override
  String toString() {
    return 'Creneau(date: $_date, etat: $_etat, creneau: $_creneau)';
  }
}

class Reservation {
  Creneau creneau; // Objet de type Creneau
  Etat etat; // État de type enum Etat
  String nomClient; // Nom du client
  List<String> images; // Liste d'images
  double acompte; // Acompte en double
  List<double> reste; // Liste des montants restants
  List<Prestation> prestations; // Objet de type Prestation

  Reservation({
    required this.creneau,
    required this.etat,
    required this.nomClient,
    required this.images,
    required this.acompte,
    required this.reste,
    required this.prestations,
  });


  /// Exemple de méthode pour calculer le montant total restant à payer.
  double montantTotalRestant() {
    return reste.fold(0, (sum, element) => sum + element);
  }

  /// Méthode pour afficher les détails de la réservation.
  @override
  String toString() {
    return '''
    Réservation:
      Nom client: $nomClient
      État: ${etat.name}
      Acompte: $acompte
      Montant restant: ${montantTotalRestant()}
      Prestation: ${prestations}
      Nombre d'images: ${images.length}
      Creneau : ${creneau.toString()}
    ''';
  }
}

class Membre {
  String nom;
  String photo;

  Membre({required this.nom, required this.photo});

}

class Indisponible {
  Creneau creneau;
  String id;

  Indisponible({required this.id, required this.creneau});

}

// Générer une liste de 10 objets Indisponible
List<Indisponible> generateIndisponibles() {
  List<Indisponible> indisponibles = [];
  for (int i = 0; i < 10; i++) {
    DateTime date = DateTime(2024, 12, i + 1, 8 + i); // Exemple de date et heure
    Creneau creneau = Creneau(
      date: date,
      etat: i%3==0 ? Etat.INDISPONIBLE : Etat.HC,
      creneau: date.add(Duration(hours: 1)), // Créneau d'une heure
    );
    Indisponible indisponible = Indisponible(
      id: 'IND-${i + 1}',
      creneau: creneau,
    );
    indisponibles.add(indisponible);
  }
  return indisponibles;
}


List<Creneau> genererCreneaux(DateTime heureDebut, DateTime heureFin) {
  List<Creneau> creneaux = [];
  List<Indisponible> indisponibles = generateIndisponibles();

  DateTime prochainCreneau = heureDebut;
  while (prochainCreneau.isBefore(heureFin)) {
    List<Indisponible> _indisp = indisponibles.where((_i){
      return _i.creneau.creneau.isAtSameMomentAs(prochainCreneau);
    }).toList();
    if(_indisp.length > 0){
      creneaux.add(Creneau(
        date: DateTime(prochainCreneau.year, prochainCreneau.month, prochainCreneau.day),
        etat: _indisp[0].creneau.etat, // Par défaut, tous les créneaux sont DISPONIBLES
        creneau: prochainCreneau,
      ));
    }
    else {
      creneaux.add(Creneau(
        date: DateTime(prochainCreneau.year, prochainCreneau.month, prochainCreneau.day),
        etat: Etat.DISPONIBLE, // Par défaut, tous les créneaux sont DISPONIBLES
        creneau: prochainCreneau,
      ));
    }

    // Ajouter un intervalle de 30 minutes pour le prochain créneau
    prochainCreneau = prochainCreneau.add(Duration(minutes: 30));
  }

  return creneaux;
}

String formaterDate(DateTime date) {
  // Liste des jours en français
  List<String> joursFrancais = [
    'Dimanche', 'Lundi', 'Mardi', 'Mercredi',
    'Jeudi', 'Vendredi', 'Samedi'
  ];
  // Extraire le jour, le mois et l'année
  String jour = joursFrancais[date.weekday % 7]; // Lundi = 1, Dimanche = 0
  String mois = moisFrancais[date.month - 1]; // Mois commence à 1
  String jourDuMois = date.day.toString().padLeft(2, '0'); // Ajouter un zéro si nécessaire
  int annee = date.year;

  print(jour);

  return '$jour $jourDuMois $mois $annee';
}

List<List<DateTime?>> recupererSemainesDuMois(DateTime date) {
  // Obtenir le mois et l'année à partir de la date
  int annee = date.year;
  int mois = date.month;

  // Déterminer le premier et le dernier jour du mois
  DateTime premierJour = DateTime(annee, mois, 1);
  DateTime dernierJour = DateTime(annee, mois + 1, 0);

  List<List<DateTime?>> semaines = [];
  List<DateTime?> semaineCourante = [];

  // Initialiser avec le premier lundi précédent ou actuel
  DateTime jour = premierJour.subtract(Duration(days: premierJour.weekday - 1));

  while (jour.isBefore(dernierJour) || jour.weekday != DateTime.monday) {
    semaineCourante.add(jour.isBefore(premierJour) || jour.isAfter(dernierJour) ? null : jour);

    // Passer au jour suivant
    jour = jour.add(Duration(days: 1));

    // Si on atteint un dimanche, ajouter la semaine et réinitialiser
    if (semaineCourante.length == 7) {
      semaines.add(semaineCourante);
      semaineCourante = [];
    }
  }

  return semaines;
}

int recupererNumeroSemaine(DateTime date) {
  // Premier jeudi de l'année
  DateTime premierJanvier = DateTime(date.year, 1, 1);
  DateTime premierJeudi = premierJanvier.add(Duration(days: (4 - premierJanvier.weekday + 7) % 7));

  // Début de la première semaine ISO (lundi précédent ou égal au premier jeudi)
  DateTime debutPremiereSemaine = premierJeudi.subtract(Duration(days: premierJeudi.weekday - 1));

  // Nombre de jours entre la date et le début de la première semaine
  int differenceEnJours = date.difference(debutPremiereSemaine).inDays;

  // Calcul du numéro de semaine
  return (differenceEnJours ~/ 7) + 1;
}

List<DateTime> getWeekDates(DateTime inputDate) {
  // Trouver le début de la semaine (lundi)
  final int weekday = inputDate.weekday; // 1 = Lundi, ..., 7 = Dimanche
  final DateTime startOfWeek = inputDate.subtract(Duration(days: weekday - 1));

  // Générer les 7 dates de la semaine
  return List<DateTime>.generate(7, (index) => startOfWeek.add(Duration(days: index)));
}



class InstitutModel {
  // Propriétés
  String nom;
  String telephone;
  String siteWeb;
  Map<String, Map<String, dynamic>> horaires; // Horaires incluant description et ouverture
  List<String> images; // Liens vers les images de l'institut
  String presentation;
  Map<String, String> liens; // Liens des logos des réseaux sociaux

  // Constructeur
  InstitutModel({
    required this.nom,
    required this.telephone,
    required this.siteWeb,
    required this.horaires,
    required this.images,
    required this.presentation,
    required this.liens,
  });

  // Méthode pour afficher les détails sous forme de chaîne (exemple)
  @override
  String toString() {
    return '''
Institut:
  Nom: $nom
  Téléphone: $telephone
  Site Web: $siteWeb
  Horaires: $horaires
  Images: $images
  Présentation: $presentation
  Liens Réseaux Sociaux: $liens
''';
  }
}

InstitutModel institut = InstitutModel(
  nom: "Institut Bien-Être",
  telephone: "+33 1 23 45 67 89",
  siteWeb: "https://institut-bienetre.com",
  horaires: {
    "Lundi": {
      "description": "Horaires pour le lundi",
      "Ouverture": [
        DateTime(2024, 12, 4, 9, 0), // Heure d'ouverture
        DateTime(2024, 12, 4, 18, 0) // Heure de fermeture
      ],
    },
    "Mardi": {
      "description": "Horaires pour le mardi",
      "Ouverture": [
        DateTime(2024, 12, 5, 10, 0),
        DateTime(2024, 12, 5, 17, 0)
      ],
    },
    "Mercredi": {
      "description": "Horaires pour le mercredi",
      "Ouverture": [
        DateTime(2024, 12, 6, 9, 30),
        DateTime(2024, 12, 6, 16, 30)
      ],
    },
    "Jeudi": {
      "description": "Horaires pour le jeudi",
      "Ouverture": [
        DateTime(2024, 12, 7, 8, 30),
        DateTime(2024, 12, 7, 15, 0)
      ],
    },
    "Vendredi": {
      "description": "Horaires pour le vendredi",
      "Ouverture": [
        DateTime(2024, 12, 8, 9, 0),
        DateTime(2024, 12, 8, 18, 0)
      ],
    },
    "Samedi": {
      "description": "Horaires pour le samedi",
      "Ouverture": [
        DateTime(2024, 12, 9, 10, 0),
        DateTime(2024, 12, 9, 14, 0)
      ],
    },
    "Dimanche": {
      "description": "Horaires pour le dimanche (fermé)",
      "Ouverture": [
        DateTime(2024, 12, 10, 8, 0), // Pas d'ouverture
        DateTime(2024, 12, 10, 13, 0) // Pas de fermeture
      ],
    },
  },
  images: [
    "https://example.com/image1.jpg",
    "https://example.com/image2.jpg"
  ],
  presentation: "Nous offrons des soins de qualité avec des produits naturels.",
  liens: {
    "G": "https://example.com/logo-google.png",
    "I": "https://example.com/logo-instagram.png",
    "F": "https://example.com/logo-facebook.png",
    "X": "https://example.com/logo-x.png",
    "T": "https://example.com/logo-tiktok.png",
  },
);


List<String> categories = ["Femme", "Homme", "Fille", "Garçon", "Tout le monde"];
List<String> joursSemaine = [
  "Lundi",    // 1er jour de la semaine
  "Mardi",    // 2ème jour de la semaine
  "Mercredi", // 3ème jour de la semaine
  "Jeudi",    // 4ème jour de la semaine
  "Vendredi", // 5ème jour de la semaine
  "Samedi",   // 6ème jour de la semaine
  "Dimanche", // 7ème jour de la semaine
];

List<String> moisFrancais = [
  'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
  'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
];

// Création des objets issus de la classe Prestation
List<Prestation> prestations = [
  Prestation(
    nom: "Nettoyage de tapis",
    description: "Nettoyage et désinfection professionnelle de tapis.",
    a_domicile: true,
    prix: 50.0,
    duree: "15min-20min",
    categorie: "Homme",
    type: "Tapis",
  ),
  Prestation(
    nom: "Pressing complet",
    description: "Lavage, repassage, et emballage de vos vêtements.",
    a_domicile: false,
    prix: 30.0,
    duree: "10min-15min",
    categorie: "Femme",
    type: "Vêtements",
  ),
  Prestation(
    nom: "Réparation d'électroménagers",
    description: "Service de réparation rapide pour appareils électroménagers.",
    a_domicile: true,
    prix: 100.0,
    duree: "45min-1h",
    categorie: "Garçon",
    type: "Électroménagers",
  ),
  Prestation(
    nom: "Coiffure à domicile",
    description: "Services de coiffure pour hommes et femmes à domicile.",
    a_domicile: true,
    prix: 40.0,
    duree: "30min-45min",
    categorie: "Fille Garçon Homme Femme",
    type: "Coiffure",
  ),
  Prestation(
    nom: "Coiffure à naturelle",
    description: "Services de coiffure.",
    a_domicile: true,
    prix: 40.0,
    duree: "30min-45min",
    categorie: "Fille Femme",
    type: "Coiffure",
  ),
  Prestation(
    nom: "Photographie d'événements",
    description: "Couverture photo professionnelle pour événements.",
    a_domicile: false,
    prix: 200.0,
    duree: "1h30-2h",
    categorie: "Tout le monde",
    type: "Événements",
  ),
];

List<Option> options = [
  Option(
    img: "assets/images/option1.png",
    nom: "Option Standard",
    duree: "10min-15min",
    prix: 15.00,
    etat: true,
  ),
  Option(
    img: "assets/images/option2.png",
    nom: "Option Premium",
    duree: "20min-30min",
    prix: 25.00,
    etat: false,
  ),
  Option(
    img: "assets/images/option3.png",
    nom: "Option Express",
    duree: "5min-10min",
    prix: 10.00,
    etat: true,
  ),
  Option(
    img: "assets/images/option4.png",
    nom: "Option Luxe",
    duree: "30min-45min",
    prix: 50.00,
    etat: false,
  ),
  Option(
    img: "assets/images/option5.png",
    nom: "Option Éco",
    duree: "15min-20min",
    prix: 12.00,
    etat: true,
  ),
];

// Création des prestations
List<Prestation> autres_prestations = [
  Prestation(
    nom: "Massage Relaxant",
    description: "Un massage pour détendre les muscles.",
    a_domicile: false,
    prix: 50.0,
    duree: "1h",
    categorie: "Bien-être",
    type: "Massage",
  ),
  Prestation(
    nom: "Coiffure",
    description: "Une coiffure moderne et stylée.",
    a_domicile: true,
    prix: 30.0,
    duree: "30min",
    categorie: "Beauté",
    type: "Coiffure",
  ),
  Prestation(
    nom: "Manucure",
    description: "Des soins complets pour vos ongles.",
    a_domicile: false,
    prix: 25.0,
    duree: "45min",
    categorie: "Beauté",
    type: "Soins des ongles",
  ),
  Prestation(
    nom: "Maquillage",
    description: "Un maquillage professionnel pour vos événements.",
    a_domicile: true,
    prix: 40.0,
    duree: "1h",
    categorie: "Beauté",
    type: "Maquillage",
  ),
  Prestation(
    nom: "Soins du visage",
    description: "Des soins revitalisants pour votre peau.",
    a_domicile: false,
    prix: 60.0,
    duree: "1h30",
    categorie: "Bien-être",
    type: "Soins visage",
  ),
];

