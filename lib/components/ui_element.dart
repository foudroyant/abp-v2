import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/utils.dart';
import '../utils/data.dart';
import '../utils/lib_fn.dart';


Widget lesdates(String ladate, String jour, bool focus){
  return Container(
      child : Column(
          children : [
            Container(
              width: 24,
              height: 24,
              decoration: focus ? ShapeDecoration(
                color: Color(0xFF248ACF),
                shape: OvalBorder(),
              ) : null,
              child: Center(
                child: Text(
                  ladate,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: focus ? Colors.white : Colors.black,
                    fontSize: 13,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    //height: 0.11,
                    letterSpacing: -0.08,
                  ),
                ),
              ),
            ),
            SizedBox(height : 10),
            Text(
              jour,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x993C3C43),
                fontSize: 11,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
                //height: 0.11,
                letterSpacing: 0.07,
              ),
            ),
          ]
      )
  );
}

Widget _infos(String state, int num){
  Color couleur = Colors.white;
  switch(state){
    case 'Disponible' : couleur = Color(0xFF21BF49); break;
    case 'Indisponible' : couleur = Color(0xFF9B9B9B); break;
    case 'Réservé' : couleur = Color(0xFFCC9812); break;
    case 'Annulé' : couleur = Color(0xFFFC4004); break;
    default : couleur = Colors.white;

  }
  return Row(
    children : [
      Container(
        width: 12.50,
        height: 10.43,
        decoration: ShapeDecoration(
          color: couleur,
          shape: couleur == Colors.white ? OvalBorder(
            side: BorderSide(width: 1, color: Color(0xF71ABC43)),
          ) : OvalBorder(),
        ),
      ),
      SizedBox(width : 5),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: state+" ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
              ),
            ),
            TextSpan(
              text: '(${num})',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    ]
  );
}

class BoutonAgenda extends StatefulWidget {
  final Creneau creneau;
  final BuildContext context;

  const BoutonAgenda({
    required this.creneau,
    required this.context,
    Key? key,
  }) : super(key: key);

  @override
  _BoutonAgendaState createState() => _BoutonAgendaState();
}

class _BoutonAgendaState extends State<BoutonAgenda> {
  late Creneau creneau;

  @override
  void initState() {
    super.initState();
    creneau = widget.creneau;  // Initialisation de creneau à partir du widget
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 10, right: 5, bottom: 0),
      child: Container(
        width: 80,
        height: 30,
        decoration: ShapeDecoration(
          color: getColorForEtat(creneau.etat),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: creneau.etat == Etat.HC
                ? BorderSide(width: 1, color: Color(0xFF1ABC43))
                : BorderSide.none,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                '${creneau.creneau.hour}:${creneau.creneau.minute.toString().padLeft(2, '0')}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: creneau.etat == Etat.HC
                      ? Color(0xF71ABC43)
                      : Colors.white,
                  fontSize: 10,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              right: 5,
              top: 4,
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).showBottomSheet(
                        (BuildContext context) {
                      return Container(
                        width: 369,
                        //height: 526,
                        padding: EdgeInsets.only(
                            left: 10, top: 10, right: 10, bottom: 10),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.95),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Colors.black.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 35,
                              child: const Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      'Gérer le statut ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF444444),
                                        fontSize: 20,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 0.06,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    child: InkWell(
                                        onTap: null,
                                        child: Icon(Icons.close)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 341,
                              height: 1,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Color(0xFFCAC4D0),
                                  ),
                                ),
                              ),
                            ),
                            StateWidget(
                              titre: 'Disponible',
                              description:
                              'Les créneaux disponibles sont visibles au public et peuvent être réservés par un client.',
                              couleur: Color(0xFF21BF49),
                              isSwitched: creneau.etat == Etat.DISPONIBLE,
                              onSwitchChanged: (bool value) {
                                setState(() {
                                  creneau.etat = value
                                      ? Etat.DISPONIBLE
                                      : creneau.etat;
                                });
                              },
                            ),
                            StateWidget(
                              titre: 'Heure creuses',
                              description:
                              'Les créneaux des heures creuses sont visibles aux utilisateurs et peuvent être réservés par un client.',
                              couleur: Color(0xFF48925B),
                              isSwitched: creneau.etat == Etat.HC,
                              onSwitchChanged: (bool value) {
                                setState(() {
                                  creneau.etat = value ? Etat.HC : creneau.etat;
                                });
                              },
                            ),
                            StateWidget(
                              titre: 'Réserver',
                              description:
                              'Prendre un rendez-vous pour un nouveau client ou un client existant.',
                              couleur: Color(0xFFCC9812),
                              isSwitched: creneau.etat == Etat.RESERVE,
                              onSwitchChanged: (bool value) {
                                setState(() {
                                  creneau.etat =
                                  value ? Etat.RESERVE : creneau.etat;
                                });
                              },
                            ),
                            StateWidget(
                              titre: 'Indisponible',
                              description:
                              'Les créneaux des heures indisponibles ne sont pas visible aux utilisateurs et ne peuvent pas être réserver.',
                              couleur: Color(0xFF9B9B9B),
                              isSwitched: creneau.etat == Etat.INDISPONIBLE,
                              onSwitchChanged: (bool value) {
                                setState(() {
                                  creneau.etat =
                                  value ? Etat.INDISPONIBLE : creneau.etat;
                                });
                              },
                            ),
                            StateWidget(
                              titre: 'Annuler',
                              description:
                              'Les créneaux des rendez-vous annulés sont visible aux utilisateurs et peuvent être réserver.',
                              couleur: Color(0xFFFC4004),
                              isSwitched: creneau.etat == Etat.ANNULE,
                              onSwitchChanged: (bool value) {
                                setState(() {
                                  creneau.etat =
                                  value ? Etat.ANNULE : creneau.etat;
                                });
                              },
                            ),
                            StateWidget(
                              titre: 'Exemple par défaut',
                              description:
                              'Autoriser le choix unique. C’est après le clique que la couleur de switch change.',
                              couleur: Color(0xFF1E1E1E),
                              isSwitched: creneau.etat == Etat.DISPONIBLE,
                              onSwitchChanged: (bool value) {
                                setState(() {
                                  creneau.etat =
                                  value ? Etat.DISPONIBLE : creneau.etat;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.more_vert,
                  color: creneau.etat == Etat.HC
                      ? Color(0xF71ABC43)
                      : Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Widget duplication(String entete, String description, bool isSwitched, void Function(bool etat) action){
  return Row(
      mainAxisAlignment : MainAxisAlignment.spaceBetween,
    children : [
      Container(
        width : 290,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: entete,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: description,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),

      //Swith()
      Switch(
        value: isSwitched,
        onChanged: action,
        activeTrackColor: Color(0xFF1E5F99),  // Couleur de la piste quand actif
        activeColor: Colors.white,            // Couleur du cercle quand actif
      ),
    ]
  );
}

Widget CA(String chiffre){
  return Container(
    padding: const EdgeInsets.only(top : 10, right : 10),
    width : double.infinity,
    child: Text(
      'CA :  ${chiffre} €',
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontSize: 13,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget la_legende(){
  return Container(
      padding: const EdgeInsets.only(left : 5, top : 10, right : 5),
      child : Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children : [
            _infos("Disponible", 24),
            _infos("HC", 2),
            _infos("Indisponible", 2),
            _infos("Réservé", 2),
            _infos("Annulé", 2),
          ]
      )
  );
}

class ContainerDates extends StatefulWidget {
  const ContainerDates({Key? key}) : super(key: key);

  @override
  State<ContainerDates> createState() => _ContainerDatesState();
}

class _ContainerDatesState extends State<ContainerDates> {
  // Variable d'état pour gérer l'index actif
  int _focusedIndex = DateTime.now().weekday - 1;
  // Liste des jours de la semaine
  final List<String> daysOfWeek = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
  late DateTime dateActuelle;

  List<DateTime> getWeekDates(DateTime inputDate) {
    // Trouver le début de la semaine (lundi)
    final int weekday = inputDate.weekday; // 1 = Lundi, ..., 7 = Dimanche
    final DateTime startOfWeek = inputDate.subtract(Duration(days: weekday - 1));

    // Générer les 7 dates de la semaine
    return List<DateTime>.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {

    final DateTime inputDate = DateTime(2024, 11, 29); // Vendredi 29 Novembre 2024
    final List<DateTime> weekDates = getWeekDates(inputDate);

    return Container(
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
              context.read<Utils>().updateDate(value);
              setState(() {
                _focusedIndex = index; // Mettre à jour l'index actif
              });
              print('Index cliqué : $index ------ Index actif : $_focusedIndex');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: lesdates(value.day.toString(), daysOfWeek[value.weekday - 1], _focusedIndex == index),
            ),
          );
        })
            .toList(),
      ),
    );
  }
}


Widget container_du_mois(){
  return Container(
      width : double.infinity,
      padding: const EdgeInsets.only(left : 0, top :0, right : 0 , bottom : 10),
      child : Stack(
          children : [
            Center(
              child: Text(
                'Novembre 2024',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.41,
                ),
              ),
            ),
            Positioned(
              right : 10,
              top : 10,
              child : Text(
                'Liste d’attente',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFFD72020),
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                  letterSpacing: -0.41,
                ),
              ),
            )
          ]
      )
  );
}

Widget separateur(double width){
  return Container(
      width: width,
      height: 1,
      decoration: BoxDecoration(color: Color(0xFFE5E5EA))
  );
}


class StateWidget extends StatefulWidget {
  final String titre;
  final String description;
  final Color couleur;
  final bool isSwitched;
  final Function(bool) onSwitchChanged;

  const StateWidget({
    required this.titre,
    required this.description,
    required this.couleur,
    required this.isSwitched,
    required this.onSwitchChanged,
    Key? key,
  }) : super(key: key);

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  late bool _isSwitched;

  @override
  void initState() {
    super.initState();
    // Initialisez l'état interne avec la valeur de `isSwitched` passée en paramètre
    _isSwitched = widget.isSwitched;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        width: 335,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.titre,
                    style: TextStyle(
                      color: widget.couleur,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
                widget.onSwitchChanged(value); // Exécuter la fonction passée en paramètre
              },
              activeTrackColor: widget.couleur,
              activeColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
