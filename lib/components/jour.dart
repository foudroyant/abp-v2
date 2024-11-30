import 'package:abp/components/ui_element.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/utils.dart';
import '../utils/data.dart';
import '../utils/fn_dates.dart';

class Jour extends StatefulWidget {
  const Jour({Key? key}) : super(key: key);

  @override
  State<Jour> createState() => _JourState();
}

class _JourState extends State<Jour> {
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Appeler la fonction du provider ici pour initialiser l'état
    context.read<Utils>().genererCreneaux();
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> jours = getDatesOfCurrentWeek(today);

    /*final creneauxProvider = Provider.of<Utils>(context, listen: false);
    creneauxProvider.genererCreneaux();*/

    return ListView(
      children : [
        //CHIFFRE D'AFFAIRE
        CA("240"),

        //MOIS ET ANNEE
        container_du_mois(),

        //LES DATES
        ContainerDates(),//container_des_dates(),

        //INFOS
        la_legende(),

        //SEPARATEUR
        SizedBox(height : 5),
        separateur(double.infinity),

        Center(
          child: Wrap(
            children: context.watch<Utils>().creneaux.map((item) {
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
