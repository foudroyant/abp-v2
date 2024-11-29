import 'package:abp/components/ui_element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/utils.dart';
import '../utils/data.dart';

class Semaine extends StatefulWidget {
  const Semaine({Key? key}) : super(key: key);

  @override
  State<Semaine> createState() => _SemaineState();
}

class _SemaineState extends State<Semaine> {
  List _data = [true, true, true, true];


  @override
  Widget build(BuildContext context) {
    List<Creneau> creneaux = genererCreneaux(context.read<Utils>().dateActuelle, 10);

    return ListView(
      children : [
        //CHIFFRE D'AFFAIRE
        CA("240"),

        //MOIS ET ANNEE
        container_du_mois(),

        //LES DATES
        ContainerDates(),

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
                        _data[index] = !isExpanded;
                      });
                    });
                  },
                children : _data.map((item){
                  //print(item);
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
                            'Lundi 8 Avril 2024',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0,
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
                    isExpanded: item,

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
