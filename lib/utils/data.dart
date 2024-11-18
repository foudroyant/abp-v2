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

class Creneau {
  DateTime la_date;
  String le_membre;
  EtatDisponible etat;

  Creneau({
    required this.la_date,
    required this.le_membre,
    required this.etat,
  });
}

class InstitutModel {
  late String nom;
  late String id;
  late Map horaires;
  late bool est_admin;

  InstitutModel({
    required this.id,
  required this.nom,
  required this.horaires,
  required this.est_admin
});

  Map get getHoraires => horaires;
  String get getId => id;
  String get getNom => nom;
  bool get getAdmin => est_admin;

  void setNom(String nom){this.nom = nom;}
  void setAdmin(bool etat){
    this.est_admin = etat;
  }
}

List<String> categories = ["Femme", "Homme", "Fille", "Garçon", "Tout le monde"];

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
