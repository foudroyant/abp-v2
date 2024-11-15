import 'package:flutter/material.dart';

import 'item_team.dart';

class Clients extends StatefulWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        Padding(
          padding: const EdgeInsets.only(left : 15,  top : 10, right : 10, bottom : 5),
          child: Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children : [
              Text(
                'Equipes',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children : [
                  Text(
                    'Clients (24)',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF094171),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (_value){},
                    activeTrackColor: Color(0xFF1E5F99),  // Couleur de la piste quand actif
                    activeColor: Colors.white,            // Couleur du cercle quand actif
                  ),
                  Text(
                    'Groupes (8)',
                    style: TextStyle(
                      color: Color(0xFF094171),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]
              )
            ]
          ),
        ),
        Container(
            width : double.infinity,
            height : 80,
            child : ListView.builder(
              scrollDirection : Axis.horizontal,
              itemCount : 4, itemBuilder: (BuildContext context, int index) {
              return index == 0 ? Padding(
                padding: const EdgeInsets.only(left : 10, top : 0, right : 10),
                child: Column(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Color(0xFFADB5BD)),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child : Center(child : Icon(Icons.add))
                    ),
                    Text(
                      'Ajouter',
                      style: TextStyle(
                        color: Color(0xFF0F1828),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ) : Padding(
                padding: const EdgeInsets.only(top : 0, right : 10),
                child: Item_Team(is_connected: index%2==0),
              );
            },

            )
        ),
        Column(
          children : [
            Container(
              width : double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children : [
                  Container(
                    width: 62,
                    height: 59,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Ellipse 5.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width : 10),
                  Container(
                    width: 300,
                    child: Column(
                        mainAxisAlignment : MainAxisAlignment.start,
                      children : [
                        Row(
                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                          children : [
                            Text(
                              'VIP',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'CA 240 €',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]
                        ),
                        Row(
                          children : [
                            Container(
                              width: 23,
                              height: 17,
                              padding: const EdgeInsets.symmetric(horizontal: 2.52, vertical: 1.86),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/ant-design_team-outlined.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(width : 8),
                            Text(
                              '24',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width : 8),
                            Text(
                              'Membres',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 13,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ]
                        ),
                        Text(
                          'Les clients avec l’abonnement Premium ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]
                    ),
                  )
                ]
              ),
            )
          ]
        )
      ]
    );
  }
}
