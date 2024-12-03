import 'package:flutter/material.dart';

import '../components/ui_element.dart';
import '../utils/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DateTime today = DateTime.now();
  DateTime dateActuelle = DateTime.now();
  // Variable d'état pour gérer l'index actif : Aujourd'hui
  int _focusedIndex = DateTime.now().weekday - 1;

  // Liste des jours de la semaine
  final List<String> daysOfWeek = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];


// Création des réservations
  late List<Reservation> reservations;
  List<Creneau> creneaux = [];

  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= 31; i++) {
      for (int h = 8; h <= 17; h++) {
        setState((){
          creneaux.add(
            Creneau(
              date: DateTime(2024, 12, i),
              etat: h%2==0 ? Etat.RESERVE : Etat.ANNULE,
              creneau: DateTime(2024, 12, i, h, (h < 17 ? 0 : 30)), // Heure et minute
            ),
          );
        });
      }
    }

    setState((){
      reservations = List.generate(5, (index) {
        return Reservation(
          creneau: creneaux[index],
          etat: creneaux[index].etat,
          nomClient: "Client ${index + 1}",
          images: [], // Pas d'images dans cet exemple
          acompte: 10.0 * (index + 1),
          reste: [5.0 * (index + 1), 7.5 * (index + 1)],
          prestations: autres_prestations,
        );
      });
    });
  }

  Widget _separateur(double width){
    return Container(
        width: width,
        height: 1,
        decoration: BoxDecoration(color: Color(0xFFE5E5EA))
    );
  }

  Widget _dates(String ladate, String, bool focus){
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
                '07',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  height: 0.11,
                  letterSpacing: -0.08,
                ),
              ),
            ),
          ),
          SizedBox(height : 10),
          Text(
            'Mon',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0x993C3C43),
              fontSize: 11,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w400,
              height: 0.11,
              letterSpacing: 0.07,
            ),
          ),
        ]
      )
    );
  }

  Widget _creneau_vide(String ladate){

    return Container(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 5),
      child : Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children : [
          Text(
            '08:00',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0x993C3C43),
              fontSize: 12,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 0.30,
            ),
          ),
          Container(
            width: 325,
            height: 1,
            decoration: BoxDecoration(color: Color(0xFFE5E5EA)),
          )
        ]
      )
    );
  }

  Widget _rdv_cancel(Reservation reservation){
    DateTime heure = reservation.creneau.creneau;
    return Container(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 5),
      child : Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children : [
          Text(
            '${heure.hour}:${heure.minute}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0x993C3C43),
              fontSize: 12,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              //height: 0,
              letterSpacing: 0.30,
            ),
          ),

          Stack(
            children : [
              Container(
                  padding: const EdgeInsets.only(top: 10, left: 0, right: 5, bottom: 0),
                width: 312,
                height: 75,
                decoration: ShapeDecoration(
                  color: Colors.pink[100],
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF194D7B)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child : Column(
                  children : [
                    Text(
                      '${reservation.nomClient} | Balayage + Coloration+ Manucure',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                        letterSpacing: -0.08,
                      ),
                    ),
                    SizedBox(height : 30),
                    Text(
                      'Annulé',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0.06,
                        letterSpacing: 0.07,
                      ),
                    ),
                  ]
                )
              ),
              Positioned(
                top : 186,
                left : -10,
                child : _separateur(325)
              )
            ]
          )
        ]
      )
    );
  }

  Widget rdv_jaune(Reservation reservation){
    DateTime heure = reservation.creneau.creneau;
    String _prestations = reservation.prestations.map((p){
      return p.nom;
    }).toList().join(" + ");

    List<double> _prix = reservation.prestations.map((p){
      return p.prix;
    }).toList();

    return Container(
      width : double.infinity,
      height : 100,
      padding: const EdgeInsets.only(top: 5, left: 10, right: 0, bottom: 5),
      child : Stack(
        children : [
          Positioned(
            top : 10,
            child : Text(
              "${heure.hour}:${heure.minute}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x993C3C43),
                fontSize: 12,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.30,
              ),
            ),
          ),
          Positioned(
            top : 60,
            child : Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x993C3C43),
                fontSize: 12,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.30,
              ),
            )
          ),
          Positioned(
            right : 5,
            child: Container(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 0),
              width: 313,
              height: 90,
              decoration: ShapeDecoration(
                color: Color(0xFFF8B60F),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF5856D6)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child : Column(
              crossAxisAlignment : CrossAxisAlignment.start,
                children : [
                  Text(
                    '${reservation.nomClient} | ${_prestations}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: -0.08,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Acompte',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        ),
                        TextSpan(
                          text: ' : 10 €',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                    children : [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Reste à payer :',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.07,
                              ),
                            ),
                            TextSpan(
                              text: ' 25 € + 10 €',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 30,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/1745.png"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      )
                    ]
                  )
                ]
              )
            ),
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateTime inputDate = DateTime.now(); // Aujourd'hui
    final List<DateTime> weekDates = getWeekDates(inputDate);

    return Column(
      children : [
        Container(
          padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
          child: Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children : [
              Text(
                'CA :  240 €',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),

              Text(
                'Novembre 2024',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                  letterSpacing: -0.41,
                ),
              ),

              Text(
                'Liste d’attente',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD72020),
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                  letterSpacing: -0.41,
                ),
              ),
            ]
          ),
        ),
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


                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: lesdates(value.day.toString(), daysOfWeek[value.weekday - 1], _focusedIndex == index),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height : 10),
        Container(
          width: double.infinity,
          height: 1,
            decoration: BoxDecoration(color: Color(0xFFE5E5EA))
        ),
        Column(
          //
          /*
          _creneau_vide("08:00"),
            _rdv_cancel(),
            rdv_jaune()
           */
          children : reservations.map((reservation){
            if(reservation.etat == Etat.ANNULE){
              return InkWell(
                onTap : (){
                  print(reservation);
                },
                  child: _rdv_cancel(reservation)
              );
            }
            else {
              return InkWell(
                  onTap : (){
                    print(reservation);
                  },
                  child: rdv_jaune(reservation)
              );
            }

          }).toList()
        )
      ]
    );
  }
}
