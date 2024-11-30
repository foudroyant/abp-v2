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

List<Creneau> genererCreneaux(DateTime heureDebut, DateTime heureFin) {
  List<Creneau> creneaux = [];

  DateTime prochainCreneau = heureDebut;
  while (prochainCreneau.isBefore(heureFin)) {
    creneaux.add(Creneau(
      date: prochainCreneau,
      etat: Etat.DISPONIBLE, // Par défaut, tous les créneaux sont DISPONIBLES
      creneau: prochainCreneau,
    ));

    // Ajouter un intervalle de 30 minutes pour le prochain créneau
    prochainCreneau = prochainCreneau.add(Duration(minutes: 30));
  }

  return creneaux;
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
        DateTime(2024, 12, 10, 0, 0), // Pas d'ouverture
        DateTime(2024, 12, 10, 0, 0) // Pas de fermeture
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
    categorie: "Fille",
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
