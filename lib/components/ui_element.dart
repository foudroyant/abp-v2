import 'package:flutter/material.dart';


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
                  '07',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: focus ? Colors.white : Colors.black,
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

Widget bouton_agenda(Color couleur, BuildContext context){
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  return Padding(
    padding: const EdgeInsets.only(left : 0, top : 10, right : 5, bottom : 0),
    child: Container(
      width: 80,
      height: 30,
      //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: ShapeDecoration(
        color: couleur,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          side: couleur == Colors.white ? BorderSide(width: 1, color: Color(0xFF1ABC43)) : BorderSide.none,
        ),
      ),
      child : Stack(
        children : [
          Center(
            child: Text(
              '09:00',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: couleur == Colors.white ? Color(0xF71ABC43) : Colors.white,
                fontSize: 10,
                fontFamily: 'Sora',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Positioned(
            right :  5,
              top : 4,
            child : InkWell(
                onTap : (){
                  Scaffold.of(context).showBottomSheet(
                        (BuildContext context) {
                      return Container(
                        width: 369,
                        height: 526,
                          padding : EdgeInsets.only(left : 10, top : 10, right :10, bottom : 10),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.949999988079071),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Colors.black.withOpacity(0.10000000149011612),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child : Column(
                          children : [
                            Container(
                              width : double.infinity,
                              height : 35,
                              child: const Stack(
                                children : [
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
                                      right : 10,
                                      child : InkWell(
                                        onTap : null,
                                          child: Icon(Icons.close)
                                      )
                                  )
                                ]
                              ),
                            ),
                            Container(
                              width: 341,
                              height: 1,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFCAC4D0),
                                  ),
                                ),
                              ),
                            ),
                            StateWidget(
                              titre: 'Disponible', description: 'Les créneaux disponibles sont visible au publique et peuvent être réserver par un client.',
                              couleur: Color(0xFF21BF49), isSwitched: true, onSwitchChanged: (bool ) {  },
                            ),
                            StateWidget(
                              titre: 'Heure creuses ',
                              description: 'Les créneaux des heures creuses sont visible aux utilisateurs et peuvent être réserver par un client.',
                              couleur: Color(0xFF48925B), isSwitched: false, onSwitchChanged: (bool ) {  },
                            ),
                            StateWidget(
                              titre: 'Réserver',
                              description: 'Prendre un rendez-vous pour un nouveau client ou un client existant.',
                              couleur: Color(0xFFCC9812), isSwitched: true, onSwitchChanged: (bool ) {  },
                            ),
                          ]
                        )
                      );
                    },
                  );
                },
                child: Icon(Icons.more_vert, color : couleur == Colors.white ? Color(0xF71ABC43) : Colors.white, size : 20)
            )
          )
        ]
      )
    ),
  );
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

Widget container_des_dates(){
  return Container(
      child : Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children :  [1,2,3,4,5,6,7].map((item){
            return Padding(
              padding: const EdgeInsets.only(left : 5, right : 5),
              child: lesdates("08:00", "Jeu", true),
            );
          }).toList()
      )
  );
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


class StateWidget extends StatelessWidget {
  final String titre;
  final String description;
  final Color couleur;
  final bool isSwitched;
  final Function(bool) onSwitchChanged;

  const StateWidget({required this.titre, required this.description, required this.couleur,
    required this.isSwitched, required this.onSwitchChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 10, bottom : 10),
      child: Container(
          width: 335,
          //height: 60,
          child : Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children : [
                Container(
                  width : 250,
                  child: Column(
                    crossAxisAlignment : CrossAxisAlignment.start,
                      children : [
                        Text(
                          titre,
                          style: TextStyle(
                            color: couleur,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]
                  ),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    onSwitchChanged(value);  // Exécuter la fonction passée en paramètre
                  },
                  activeTrackColor: couleur,
                  activeColor: Colors.white,
                )
              ]
          )
      ),
    );
  }
}
