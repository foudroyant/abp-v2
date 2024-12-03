import 'package:abp/components/ui_element.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/agenda.dart';
import '../models/utils.dart';
import '../utils/data.dart';
import '../utils/fn_dates.dart';
import '../utils/lib_fn.dart';

class Jour extends StatefulWidget {
  const Jour({Key? key}) : super(key: key);

  @override
  State<Jour> createState() => _JourState();
}

class _JourState extends State<Jour> {
  DateTime today = DateTime.now();
  // Variable d'état pour gérer l'index actif : Aujourd'hui
  int _focusedIndex = DateTime.now().weekday - 1;
  List<bool> duplications = [false, false, false];

  // Liste des jours de la semaine
  final List<String> daysOfWeek = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

  DateTime dateActuelle = DateTime.now();
  late DateTime ouverture;
  late DateTime fermeture;

  late List<Creneau> creneaux;

  void update_horaires(){

    setState((){
      ouverture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][0].hour,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][0].minute,
      );

      fermeture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][1].hour,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][1].minute,
      );
      creneaux = genererCreneaux(ouverture, fermeture);
    });
  }



  @override
  void initState() {
    super.initState();
    setState((){
      ouverture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][0].hour,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][0].minute,
      );

      fermeture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][1].hour,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][1].minute,
      );

     creneaux = genererCreneaux(ouverture, fermeture);
    });

  }


  DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  void dupliquerDate(Creneau creneau, int nombre){
    DateTime c = creneau.creneau;
    DateTime d = creneau.date;
    print(creneau);
    for(var i = 1; i <= nombre; i++){
      DateTime nextDay = addDays(c, i);
      creneau.creneau = nextDay;
      creneau.date = addDays(d, i);
      print(creneau);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> jours = getDatesOfCurrentWeek(today);
    final DateTime inputDate = DateTime.now(); // Aujourd'hui
    final List<DateTime> weekDates = getWeekDates(inputDate);

    /*final creneauxProvider = Provider.of<Utils>(context, listen: false);
    creneauxProvider.genererCreneaux();*/
    //context.read<AgendaProvider>().update_creneaux_jour(creneaux);

    return ListView(
      children : [
        //CHIFFRE D'AFFAIRE
        CA("240"),

        //MOIS ET ANNEE
        container_du_mois(DateTime.now()),

        //LES DATES
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: weekDates
                .asMap()
                .entries
                .map((item) {
              final index = item.key; // Index de l'élément
              final value = item.value; // Valeur de l'élément

              return InkWell(
                onTap: () {
                  setState(() {
                    _focusedIndex = index; // Mettre à jour l'index actif
                    dateActuelle = value;
                  });
                  update_horaires();
                  print(value);


                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: lesdates(value.day.toString(), daysOfWeek[value.weekday - 1], _focusedIndex == index),
                ),
              );
            })
                .toList(),
          ),
        ),

        //INFOS
        la_legende(),

        //SEPARATEUR
        SizedBox(height : 5),
        separateur(double.infinity),

        Center(
          child: Wrap(
            children: creneaux.map((item) {
              //print(item);
              return BoutonAgenda(creneau: item, context: context);
            }).toList(),
          ),
        ),

        //SEPARATEUR
        SizedBox(height : 10),
        separateur(360),

        Padding(
          padding: const EdgeInsets.only(left : 10, top : 10, right : 10),
          child: duplication(
              'Dupliquer les changements sur 3 jours\n',
              'Les créneaux disponibles et indisponibles seront dupliqués sur trois jours.',
              duplications[0], (bool value){
            setState((){
              if(value)duplications[1] = false;duplications[2] = false;
              duplications[0] = value;
            });
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left : 10, top : 10, right : 10),
          child: duplication(
              'Dupliquer les changements sur 1 semaine\n',
              'Les créneaux disponibles et indisponibles seront dupliqués sur une semaine grissante.',
              duplications[1], (bool value){
            setState((){
              if(value)duplications[0] = false;duplications[2] = false;
              duplications[1] = value;
            });
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left : 10, top : 10, right : 10),
          child: duplication(
              'Dupliquer les changements sur 1 mois\n',
              'Les créneaux disponibles et indisponibles seront dupliqués sur un mois glissant.',
              duplications[2], (bool value){
            setState((){
              if(value) duplications[0] = false;duplications[1] = false;
              duplications[2] = value;
            });
          }),
        ),

        //BUTTON PUBLIER
        SizedBox(height : 10),
        Padding(
          padding: const EdgeInsets.only(left : 50, right : 50, bottom : 10),
          child: InkWell(
            onTap : (){
                 List<Creneau> _creneaux = creneaux.where((c){
                   return c.etat != Etat.DISPONIBLE;
                 }).toList();
                 if(_creneaux.length > 0){
                   for(var _creneau in _creneaux){
                     for(var i = 0; i < duplications.length; i++){
                       if(duplications[i] == true){
                         //ICI SE FERONT LES DUPLICATIONS
                         //print(_creneaux);
                         switch(i){
                           case 0 :
                             dupliquerDate(_creneau, 3);
                             break;
                           case 1:
                             dupliquerDate(_creneau, 7);
                           case 2:
                             dupliquerDate(_creneau, 30);
                         }
                       }
                       //AUCUNE ITERATION POUR LA DUPLICATION
                       //Toast("Veuillez precisez le nombre de changement en activant au moins l'un des switch");
                     }
                   }
                 }
              },
            child: Container(
              width: 359,
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: ShapeDecoration(
                color: Color(0xFF0F72C9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              ),
              child : Text(
                'PUBLIER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}
