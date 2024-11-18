import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/item_team.dart';
import '../components/ui_element.dart';
import '../models/option.dart';
import '../utils/data.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  String categorie = "Tout le monde";
  List<String> categories = ["Femme", "Homme", "Fille", "Garçon", "Tout le monde"];
  List<Prestation> les_prestations = prestations;
  String categorie_new_option = "Tout le monde";
  List<Option> les_options = options;

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
                          children : les_prestations.map((p){
                            return InkWell(
                              onTap : (){
                                showBottomSheet(context: context, builder: (BuildContext context) {
                                  return _update_service(p); //_bottomSheet(false);
                                });
                              },
                              child: _service(
                                  context, p),
                            );
                          }).toList(),
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

  Widget _service(BuildContext context, Prestation la_prestation){
    // Recherche de l'index dans la liste
    int index = les_prestations.indexWhere((_p) => _p.nom == la_prestation.nom);
   // context.watch<Options>().

    //context.read<Options>().set_options(les_options);

    return Padding(
      padding: const EdgeInsets.only(top : 10, bottom : 10),
      child: Column(
        children : [
          Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
            crossAxisAlignment : CrossAxisAlignment.start,
            children : [
              Text(
                la_prestation.nom,
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
                        image: AssetImage("assets/images/Delete.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width : 5),
                  Container(
                    width: 21,
                    height: 23,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/mage_edit.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ]
              )
            ]
          ),
          SizedBox(height : 10),
          Text.rich(
            TextSpan(
                children : [
                  TextSpan(
                    text: la_prestation.description,
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
                    ),
                  ),
                ]
            ),
          ),
          //separateur(390),
          SizedBox(height : 10),
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
                value: la_prestation.a_domicile,
                onChanged: (value) {
                  print(value) ; // Exécuter la fonction passée en paramètre
                  setState((){
                    les_prestations[index].setEtat(value);
                  });
                },
                activeTrackColor: Color(0xFFE6E0E9),
                activeColor: Colors.white,
              )
            ]
          ),
          //separateur(390),
          SizedBox(height : 10),
          InkWell(
            onTap : (){
              context.read<Options>().set_options(les_options);
              showBottomSheet(context: context, builder: (BuildContext context) {
                return _bottomSheet(context.read<Options>().options); //_bottomSheet(false);
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
                    'À partir de ${la_prestation.prix} €',
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
          SizedBox(height : 10),
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
                '${la_prestation.prix} €',
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
      ),
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
          child: ListView(
            //crossAxisAlignment : CrossAxisAlignment.start,
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
                _input_container(TextField(
                  decoration: InputDecoration(
                    hintText: 'Option 10',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Nom prestation "),
                SizedBox(height : 20),
                Text(
                  'Catégories ',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height : 5),
                DropdownButton<String>(
                  hint: Text('Sélectionner une option'), // Texte de l'indication
                  value: categorie, // La valeur sélectionnée actuelle
                  icon: Icon(Icons.arrow_drop_down), // Icône du menu déroulant
                  items: categories.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      categorie = newValue!; // Mise à jour de la valeur sélectionnée
                    });
                    print(categorie);
                  },
                ),
                SizedBox(height : 10),
                _input_container(TextField(
                  decoration: InputDecoration(
                    hintText: 'Prix',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Prix - en Euro"),
                SizedBox(height : 20),
                _input_container(TextField(
                  decoration: InputDecoration(
                    hintText: '15 min - 20 min',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Durée en minutes"),
                SizedBox(height : 20),
                _input_container(TextField(
                  minLines : 3,
                  maxLines : 5,
                  decoration: InputDecoration(
                    hintText: '',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 130, "Description "),
                SizedBox(height : 20),
                Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 297,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Service à domicile\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'En couchant la case, vous acceptez que la pression peut être effectuer à la domicile du client.',
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
                    Switch(
                      value: true,
                      onChanged: (_value){},
                      activeTrackColor: Color(0xFF1E5F99),  // Couleur de la piste quand actif
                      activeColor: Colors.white,            // Couleur du cercle quand actif
                    ),
                  ],
                ),
                SizedBox(height : 20),
                Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 297,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Options & Extras (0)\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Ajoutez les options et les services extras afin compléter l’offre client.',
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
                    Container(
                        width: 25,
                        height: 26,
                        padding: const EdgeInsets.symmetric(horizontal: 5.21, vertical: 5.42),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child : Icon(Icons.add)
                    )
                  ],
                ),
                SizedBox(height : 20),
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

  Widget _update_service(Prestation la_prestation){
    // Recherche de l'index dans la liste
    int index = les_prestations.indexWhere((_p) => _p.nom == la_prestation.nom);


    final TextEditingController _ctrl_nom = TextEditingController(); _ctrl_nom.text = la_prestation.nom;
    final TextEditingController _ctrl_prix = TextEditingController(); _ctrl_prix.text = la_prestation.prix.toString();
    final TextEditingController _ctrl_description = TextEditingController(); _ctrl_description.text = la_prestation.description;
    final TextEditingController _ctrl_duree = TextEditingController(); _ctrl_duree.text = la_prestation.duree;

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
        child: ListView(
            //crossAxisAlignment : CrossAxisAlignment.start,
          children : [
            Text(
              'Modifier le service',
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
            _input_container(TextField(
              controller : _ctrl_nom,
              decoration: InputDecoration(
                hintText: la_prestation.nom,
                border: InputBorder.none, // Pas de bordure par défaut
                contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
              ),
              style : TextStyle(
                color: Colors.black.withOpacity(0.8500000238418579),
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ), 345, 40, "Nom prestation "),
            SizedBox(height : 20),
            Text(
              'Catégories ',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height : 5),
            DropdownButton<String>(
              hint: Text('Sélectionner une option'), // Texte de l'indication
              value: les_prestations[index].categorie, // La valeur sélectionnée actuelle
              icon: Icon(Icons.arrow_drop_down), // Icône du menu déroulant
              items: categories.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  les_prestations[index].categorie = newValue!; // Mise à jour de la valeur sélectionnée
                });
                print(la_prestation.categorie);
              },
            ),
            SizedBox(height : 10),
            _input_container(TextField(
              controller : _ctrl_prix,
              decoration: InputDecoration(
                hintText: 'Prix',
                border: InputBorder.none, // Pas de bordure par défaut
                contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
              ),
              style : TextStyle(
                color: Colors.black.withOpacity(0.8500000238418579),
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ), 345, 40, "Prix - en Euro"),
            SizedBox(height : 20),
            _input_container(TextField(
              controller : _ctrl_duree,
              decoration: InputDecoration(
                hintText: '15 min - 20 min',
                border: InputBorder.none, // Pas de bordure par défaut
                contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
              ),
              style : TextStyle(
                color: Colors.black.withOpacity(0.8500000238418579),
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ), 345, 40, "Durée en minutes"),
            SizedBox(height : 20),
            _input_container(TextField(
              controller : _ctrl_description,
              minLines : 3,
              maxLines : 5,
              decoration: InputDecoration(
                hintText: '',
                border: InputBorder.none, // Pas de bordure par défaut
                contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
              ),
              style : TextStyle(
                color: Colors.black.withOpacity(0.8500000238418579),
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ), 345, 130, "Description "),
            SizedBox(height : 20),
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 297,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Service à domicile\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'En couchant la case, vous acceptez que la pression peut être effectuer à la domicile du client.',
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
                Switch(
                  value: les_prestations[index].a_domicile,
                  onChanged: (_value){
                    setState((){
                      les_prestations[index].setEtat(_value);
                    });
                  },
                  activeTrackColor: Color(0xFF1E5F99),  // Couleur de la piste quand actif
                  activeColor: Colors.white,            // Couleur du cercle quand actif
                ),
              ],
            ),
            SizedBox(height : 20),
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 297,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Options & Extras (0)\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Ajoutez les options et les services extras afin compléter l’offre client.',
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
                Container(
                  width: 25,
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 5.21, vertical: 5.42),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child : InkWell(
                      child: Icon(Icons.add),
                    onTap : (){
                      showBottomSheet(context: context, builder: (BuildContext context) {
                        return _add_prestation(); //_bottomSheet(false);
                      });
                    }
                  )
                )
              ],
            ),
            SizedBox(height : 20),
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

  Widget _update_prestation(){
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
          child: ListView(
            //crossAxisAlignment : CrossAxisAlignment.start,
              children : [
                Text(
                  'Option',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
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
                SizedBox(height : 10),
                _input_container(TextField(
                  decoration: InputDecoration(
                    hintText: 'Option 10',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Nom option "),
                SizedBox(height : 20),
                Text(
                  'Catégories ',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height : 5),
                DropdownButton<String>(
                  hint: Text('Sélectionner une option'), // Texte de l'indication
                  value: categorie, // La valeur sélectionnée actuelle
                  icon: Icon(Icons.arrow_drop_down), // Icône du menu déroulant
                  items: categories.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      categorie = newValue!; // Mise à jour de la valeur sélectionnée
                    });
                    print(categorie);
                  },
                ),
                SizedBox(height : 10),
                _input_container(TextField(
                  decoration: InputDecoration(
                    hintText: 'Prix',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Prix - €"),
                SizedBox(height : 20),
                _input_container(TextField(
                  decoration: InputDecoration(
                    hintText: '15 min - 20 min',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Durée en minutes"),
                SizedBox(height : 20),
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

  Widget _add_prestation(){
    final TextEditingController _ctrl_nom = TextEditingController();
    final TextEditingController _ctrl_prix = TextEditingController();
    final TextEditingController _ctrl_duree = TextEditingController();

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
          child: ListView(
            //crossAxisAlignment : CrossAxisAlignment.start,
              children : [
                Text(
                  'Option',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
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
                SizedBox(height : 10),
                _input_container(TextField(
                  controller : _ctrl_nom,
                  decoration: InputDecoration(
                    hintText: 'Option 10',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Nom option "),
                SizedBox(height : 20),
                Text(
                  'Catégories ',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height : 5),
                DropdownButton<String>(
                  hint: Text('Sélectionner une option'), // Texte de l'indication
                  value: categorie_new_option, // La valeur sélectionnée actuelle
                  icon: Icon(Icons.arrow_drop_down), // Icône du menu déroulant
                  items: categories.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      categorie_new_option = newValue!; // Mise à jour de la valeur sélectionnée
                    });
                    print(categorie);
                  },
                ),
                SizedBox(height : 10),
                _input_container(TextField(
                  controller : _ctrl_prix,
                  decoration: InputDecoration(
                    hintText: 'Prix',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Prix - €"),
                SizedBox(height : 20),
                _input_container(TextField(
                  controller : _ctrl_duree,
                  decoration: InputDecoration(
                    hintText: '15 min - 20 min',
                    border: InputBorder.none, // Pas de bordure par défaut
                    contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                  ),
                  style : TextStyle(
                    color: Colors.black.withOpacity(0.8500000238418579),
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ), 345, 40, "Durée en minutes"),
                SizedBox(height : 20),
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
                          Map _newOption = {
                            'nom' : _ctrl_nom.text,
                            'prix' : _ctrl_prix.text,
                            'categorie' : categorie_new_option,
                            'duree' : _ctrl_duree.text,
                          };

                          print(_newOption);
                          _ctrl_nom.text = "";
                          _ctrl_prix.text = "";
                          _ctrl_duree.text = "";
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

  Widget _bottomSheet(List<Option> options){
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
                  children : context.read<Options>().options.map((_o){
                    int index = les_options.indexWhere((opt) => opt.nom == _o.nom);
                    return Padding(
                      padding: const EdgeInsets.only(top : 5, bottom : 5),
                      child: Row(
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
                                          _o.nom,
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
                                          _o.duree,
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
                                    '${_o.prix} €',
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
                                  InkWell(
                                    onTap : (){
                                      context.read<Options>().switch_etat_option(_o.nom, !_o.etat);
                                      print(_o.etat);
                                      setState((){
                                        les_options[index].setEtat(!_o.etat);
                                      });
                                    },
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF1E5F99),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                        ),
                                        child : context.read<Options>().options[index].etat ? Center(child : Icon(Icons.check, color : Colors.white)) : null
                                    ),
                                  )
                                ]
                            )
                          ]
                      ),
                    );
                  }).toList()
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

  Widget _input_container(Widget child, double width, double height, String label){
    return Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height : 5),
        Container(
            width: width,
            height: height,
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
            child : child
        ),
      ],
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
