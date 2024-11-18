import 'package:abp/components/ui_element.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/fn_dates.dart';

class Jour extends StatefulWidget {
  const Jour({Key? key}) : super(key: key);

  @override
  State<Jour> createState() => _JourState();
}

class _JourState extends State<Jour> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<DateTime> jours = getDatesOfCurrentWeek(today);
    print(jours);

    return ListView(
      children : [
        //CHIFFRE D'AFFAIRE
        CA("240"),

        //MOIS ET ANNEE
        container_du_mois(),

        //LES DATES
        container_des_dates(),

        //INFOS
        la_legende(),

        //SEPARATEUR
        SizedBox(height : 5),
        separateur(double.infinity),

        Center(
          child: Wrap(
            children : [0,1,2,3,4,5,6,7,8,9].map((item){
              return bouton_agenda(Color(0xFF9B9B9B), context);
            }).toList()
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
          padding: const EdgeInsets.only(left : 50, right : 50, bottom : 10),
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
