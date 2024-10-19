import 'package:flutter/material.dart';

import '../components/jour.dart';
import '../components/semaine.dart';
import '../components/mois.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {

  Widget team(bool is_connected){
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: Stack(
            children : [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/team.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Positioned(
                right : 5,
                top : 40,
                child : Container(
                  width: 12,
                  height: 12,
                  decoration: ShapeDecoration(
                    color: Color(0xFF2CC069),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: is_connected ? Color(0xFFFCFCFC) : Color(0xFFFCFCFC),
                      ),
                    ),
                  ),
                )
              )
            ]
          ),
        ),
        Container(
          child: Text(
            'Midala',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0F1828),
              fontSize: 12,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0.11,
            ),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,  // Le nombre d'onglets
      child: Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children : [
          Container(
            padding: const EdgeInsets.only(left : 10,),
            child: Text(
              'Equipes',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          Container(
            width : double.infinity,
            height : 80,
            child : ListView.builder(
              scrollDirection : Axis.horizontal,
              itemCount : 4, itemBuilder: (BuildContext context, int index) {
                return index == 0 ? Padding(
                  padding: const EdgeInsets.only(left : 10, top : 10, right : 10),
                  child: Container(
                    width: 60,
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFFADB5BD)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child : Center(child : Icon(Icons.add))
                  ),
                ) : Padding(
                  padding: const EdgeInsets.only(top : 10, right : 10),
                  child: team(index%2==0),
                );
            },
      
            )
          ),
          const TabBar(
            tabs: [
              Tab(text: "Jour"),
              Tab(text: "Semaine"),
              Tab(text: "Mois"),
            ],
            indicatorColor: Colors.black,  // Personnaliser l'indicateur
            labelColor: Colors.black,     // Couleur des onglets sélectionnés
            unselectedLabelColor: Colors.grey, // Couleur des onglets non sélectionnés
          ),

          const Expanded(
            child: TabBarView(
              children: [
                Jour(),
                Semaine(),
                Mois()
              ],
            ),
          ),
        ]
      ),
    );
  }
}
