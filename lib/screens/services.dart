import 'package:flutter/material.dart';

import '../components/item_team.dart';
import '../components/ui_element.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,  // Le nombre d'onglets
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
                    child: Item_Team(is_connected: index%2==0),
                  );
                },

                )
            ),
            const TabBar(
              tabs: [
                Tab(text: "Femme"),
                Tab(text: "Homme"),
                Tab(text: "Fille"),
                Tab(text: "Garçon"),
                Tab(text: "Autres"),
              ],
              indicatorColor: Colors.black,  // Personnaliser l'indicateur
              labelColor: Colors.black,     // Couleur des onglets sélectionnés
              unselectedLabelColor: Colors.grey, // Couleur des onglets non sélectionnés
            ),

            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children : [
                      _prestations(),
                      Padding(
                        padding: const EdgeInsets.only(left : 8.0, right : 8),
                        child: Column(
                          children : [
                            _service(context, 'Balayage Classique',
                                'Cette technique convient à presque tous les types de cheveux et est idéale pour ajouter de la luminosité et de la et est idéale pour ajouter de la luminosité et de la dimension sans un changement radical de couleur ',
                              [15,35]
                            )
                          ]
                        ),
                      )
                    ]
                  ),
                  const Center(),
                  const Center(),
                  const Center(),
                  const Center(),
                ],
              ),
            ),
          ]
      ),
    );
  }

  Widget _prestations(){
    return Padding(
      padding: const EdgeInsets.only(top : 8),
      child: Container(
        height : 80,
        child : ListView.builder(itemBuilder: (BuildContext context,  int index) {
          return _prestation("assets/images/team.png", "Flash");
        }, scrollDirection : Axis.horizontal, itemCount : 4)
      ),
    );
  }

  Widget _prestation(String img, String nom){
    return Padding(
      padding: const EdgeInsets.only(left : 8, right : 8),
      child: Column(
        children : [
          Container(
            width: 55,
            height: 45,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(),
            ),
          ),
          SizedBox(height : 5),
          Text(
            nom,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ]
      ),
    );
  }

  Widget _service(BuildContext context, String titre, String description, List<double> prix){
    return Column(
      children : [
        Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
          crossAxisAlignment : CrossAxisAlignment.start,
          children : [
            Text(
              titre,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
                crossAxisAlignment : CrossAxisAlignment.start,
              children : [
                Container(
                  width: 21,
                  height: 23,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/team.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: 21,
                  height: 23,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/team.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ]
            )
          ]
        ),
        Text.rich(
          TextSpan(
              children : [
                TextSpan(
                  text: description,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    //height: 0,
                  ),
                ),
                TextSpan(
                  text: 'voir plus...',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    height: 0,
                  ),
                ),
              ]
          ),
        ),
        //separateur(390),
        Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children : [
            Text(
              'Service à domicile',
              style: TextStyle(
                color: Colors.black.withOpacity(0.75),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Switch(
              value: true,
              onChanged: (value) {
                print(value) ; // Exécuter la fonction passée en paramètre
              },
              activeTrackColor: Color(0xFFE6E0E9),
              activeColor: Colors.white,
            )
          ]
        ),
        //separateur(390),
        InkWell(
          onTap : (){
            showBottomSheet(context: context, builder: (BuildContext context) {
              return _bottomSheet(false);
            });
          },
          child: Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children : [
                Text(
                  'Options (4) ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  'À partir de ${prix[0]} €',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ]
          ),
        ),
        Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children : [
            Text(
              'Prix ',
              style: TextStyle(
                color: Colors.black.withOpacity(0.75),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Text(
              '${prix[1]} €',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )
          ]
        )
      ]
    );
  }

  Widget _nvle_prestation(){
    return Container(
      width : double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.10000000149011612),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
      child: Padding(
        padding: const EdgeInsets.only(left : 15, top : 10, right : 10, bottom : 10),
        child: Column(
            crossAxisAlignment : CrossAxisAlignment.start,
          children : [
            Text(
              'Nouvelle prestation',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height : 10),
            Text(
              'Enrichissez votre catalogue de services et prestations afin de donner plus de choix à vos clients.',
              style: TextStyle(
                color: Color(0xFF49454F),
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
            ),
            SizedBox(height : 10),
            Text(
              'Nom prestation ',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height : 5),
            Container(
              width: 345,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFD9D9D9),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          ]
        ),
      )
    );
  }

  Widget _bottomSheet(bool checked){
    return Container(
        width : double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.10000000149011612),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left : 20, top : 15, right : 20, bottom : 10),
          child: Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children : [
                Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Options',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    InkWell(
                      onTap : (){
                        showBottomSheet(context: context, builder: (BuildContext context) {
                          return _nvle_prestation();
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 26,
                        padding: const EdgeInsets.symmetric(horizontal: 5.21, vertical: 5.42),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child : Icon(Icons.add)
                      ),
                    )
                  ],
                ),
                SizedBox(height : 10),
                Text(
                  'Ajoutez les options à votre catalogue afin d’élargir le choix de vos clients.',
                  style: TextStyle(
                    color: Color(0xFF49454F),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25,
                  ),
                ),
                SizedBox(height : 15),
                Column(
                  children : [
                    Row(
                        mainAxisAlignment : MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment : CrossAxisAlignment.center,
                      children : [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xF2C6DFF6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child : Center(
                                child : Text(
                                  'A',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF21005D),
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.15,
                                  ),
                                ),
                              )
                            ),
                            SizedBox(width : 10),
                            Container(
                              width : 200,
                              child: Column(
                                  crossAxisAlignment : CrossAxisAlignment.start,
                                  mainAxisAlignment : MainAxisAlignment.center,
                                  children : [
                                    Text(
                                      'Option 1',
                                      style: TextStyle(
                                        color: Color(0xFF1D1B20),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 0.12,
                                        letterSpacing: 0.50,
                                      ),
                                    ),
                                    SizedBox(height : 5),
                                    Text(
                                      '15 min - 30 min',
                                      style: TextStyle(
                                        color: Color(0xFF49454F),
                                        fontSize: 13,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children : [
                            Text(
                              '49,99 €',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF49454F),
                                fontSize: 11,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 0.13,
                                letterSpacing: 0.50,
                              ),
                            ),
                            SizedBox(width : 10),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: ShapeDecoration(
                                color: Color(0xFF1E5F99),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                              ),
                              child : checked ? Center(child : Icon(Icons.check, color : Colors.white)) : null
                            )
                          ]
                        )
                      ]
                    )
                  ]
                ),
                SizedBox(height : 15),
                Row(
                    mainAxisAlignment : MainAxisAlignment.end,
                  children : [
                    InkWell(
                      onTap : (){
                        print("Retour");
                      },
                      child: Text(
                        'Retour',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1E5F99),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ),
                    SizedBox(width : 20),
                    InkWell(
                      onTap : (){
                        print("Valider");
                      },
                      child: Text(
                        'Valider',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1E5F99),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ),
                  ]
                )
              ]
          ),
        )
    );
  }

  /*
  DropdownButton<String>(
                      hint: Text('Sélectionner une option'), // Texte de l'indication
                      value: _selectedValue, // La valeur sélectionnée actuelle
                      icon: Icon(Icons.arrow_drop_down), // Icône du menu déroulant
                      items: _options.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue; // Mise à jour de la valeur sélectionnée
                        });
                      },
                    )

      Container(
                    width: 236,
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.10000000149011612),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child : TextField(
                      decoration: InputDecoration(
                        hintText: 'mon.indentification@mail.com',
                        border: InputBorder.none, // Pas de bordure par défaut
                        contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 0),
                      ),
                      style : TextStyle(
                        color: Colors.black.withOpacity(0.8500000238418579),
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ),
   */
}
