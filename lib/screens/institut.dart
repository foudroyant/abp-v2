import 'package:flutter/material.dart';

import '../components/photo_institut.dart';

class Institut extends StatefulWidget {
  const Institut({Key? key}) : super(key: key);

  @override
  State<Institut> createState() => _InstitutState();
}

class _InstitutState extends State<Institut> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,  // Le nombre d'onglets
      child: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children : [
            Center(
              child: Text(
                '124 rue de la gare, 75 000 Paris - France',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Photo_Institut(),
            const TabBar(
              tabs: [
                Tab(text: "Clients"),
                Tab(text: "Offres"),
                Tab(text: "Réalisations"),
                Tab(text: "A propos"),
              ],
              indicatorColor: Colors.black,  // Personnaliser l'indicateur
              labelColor: Colors.black,     // Couleur des onglets sélectionnés
              unselectedLabelColor: Colors.grey, // Couleur des onglets non sélectionnés
            ),

            const Expanded(
              child: TabBarView(
                children: [
                  Center(),
                  Center(),
                  Center(),
                  Center(),
                ],
              ),
            ),
          ]
      ),
    );
  }
}
