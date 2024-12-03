import 'package:abp/components/ui_element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/institut_modele.dart';
import '../models/utils.dart';
import '../utils/data.dart';

class Semaine extends StatefulWidget {
  const Semaine({Key? key}) : super(key: key);

  @override
  State<Semaine> createState() => _SemaineState();
}

class _SemaineState extends State<Semaine> {
  List etat_des_jours = [true, true, true, true, true, true, true];

  // Variable d'état pour gérer l'index actif : Aujourd'hui
  int _focusedIndex = DateTime.now().weekday - 1;

  // Liste des jours de la semaine
  final List<String> daysOfWeek = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

  DateTime dateActuelle = DateTime.now();
  late DateTime _ouverture;
  late DateTime _fermeture;


  @override
  void initState (){
    setState((){
      _ouverture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][0].hour,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][0].minute,
      );

      _fermeture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][1].hour,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][1].minute,
      );
    });
  }

  List<DateTime> getWeekDates(DateTime inputDate) {
    // Trouver le début de la semaine (lundi)
    final int weekday = inputDate.weekday; // 1 = Lundi, ..., 7 = Dimanche
    final DateTime startOfWeek = inputDate.subtract(Duration(days: weekday - 1));

    // Générer les 7 dates de la semaine
    return List<DateTime>.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  void update_horaires(){

    setState((){
      _ouverture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][0].hour,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][0].minute,
      );

      _fermeture = DateTime(
        dateActuelle.year,
        dateActuelle.month,
        dateActuelle.day,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][1].hour,
        institut.horaires[joursSemaine[_focusedIndex]]?["Ouverture"][1].minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final DateTime inputDate = DateTime.now(); // Aujourd'hui
    final List<DateTime> weekDates = getWeekDates(inputDate);

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
                      });
                      update_horaires();


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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ExpansionPanelList(
                  //expandIconColor : Color(0xD31D5F98),
                  //dividerColor : Color(0xD31D5F98),
                  elevation : 0,
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      print(isExpanded);
                      setState(() {
                        etat_des_jours[index] = !etat_des_jours[index];
                      });
                    });
                  },
                children : weekDates
                    .asMap()
                    .entries.map((item){
                  final index = item.key;
                  final value = item.value;

                  //print(value);

                  DateTime ouverture = DateTime(
                    value.year,
                    value.month,
                    value.day,
                    institut.horaires[joursSemaine[index]]?["Ouverture"][0].hour,
                    institut.horaires[joursSemaine[index]]?["Ouverture"][0].minute,
                  );
                  DateTime fermeture = DateTime(
                    value.year,
                    value.month,
                    value.day,
                    institut.horaires[joursSemaine[index]]?["Ouverture"][1].hour,
                    institut.horaires[joursSemaine[index]]?["Ouverture"][1].minute,
                  );

                  //print( "${ouverture} ---- ${fermeture}");

                  List<Creneau> creneaux = genererCreneaux(ouverture, fermeture);
                  return ExpansionPanel(
                    backgroundColor :  Colors.white,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        decoration: ShapeDecoration(
                          color: Color(0xD31D5F98),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                        ),
                        child : Center(
                          child: Text(
                            formaterDate(item.value),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              //height: 0,
                            ),
                          ),
                        ),
                      );
                    },
                    body: Center(
                      child: Wrap(
                          children : creneaux.map((item){
                            return BoutonAgenda(creneau : item, context : context);
                          }).toList()
                      ),
                    ),
                    isExpanded: etat_des_jours[index],

                  );
                }).toList()
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left : 10, top : 10, right : 10),
          child: duplication(
              'Dupliquer les changements sur 3 jours\n',
              'Les créneaux disponibles et indisponibles seront dupliqués sur trois jours.',
              true, (bool value){

          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left : 10, top : 10, right : 10),
          child: duplication(
              'Dupliquer les changements sur 1 semaine\n',
              'Les créneaux disponibles et indisponibles seront dupliqués sur une semaine grissante.',
              true, (bool value){

          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left : 10, top : 10, right : 10),
          child: duplication(
              'Dupliquer les changements sur 1 mois\n',
              'Les créneaux disponibles et indisponibles seront dupliqués sur un mois glissant.',
              true, (bool value){

          }),
        ),

        //BUTTON PUBLIER
        SizedBox(height : 10),
        Padding(
          padding: const EdgeInsets.only(left : 20, right : 20, bottom : 10),
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
      ]
    );
  }
}
