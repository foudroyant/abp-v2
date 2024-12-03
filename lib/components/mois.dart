import 'package:abp/components/ui_element.dart';
import 'package:flutter/material.dart';

import '../utils/data.dart';
import '../utils/lib_fn.dart';

class Mois extends StatefulWidget {
  const Mois({Key? key}) : super(key: key);

  @override
  State<Mois> createState() => _MoisState();
}

class _MoisState extends State<Mois> {

  DateTime date = DateTime.now(); // 15 Décembre 2024
  List<List<DateTime?>> semaines = recupererSemainesDuMois(DateTime.now());
  List<int> taille_semaine = [];
  List<int> num_semaine = [];

  Widget _btn_date(Color couleur){
    return Container(
      width: 39.73,
      height: 12.01,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: ShapeDecoration(
        color: couleur,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      child : Text(
        '9:00',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      )
    );
  }

  Widget _table_header(String texte, BuildContext context){
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width/8,
      height: 24,
      decoration: ShapeDecoration(
        //color : Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(
        texte,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }

  Widget _table(DateTime date, bool is_opened, BuildContext context, {String texte="Fermé"}){
    double _width = MediaQuery.of(context).size.width;

    DateTime ouverture = DateTime(
      date.year,
      date.month,
      date.day,
      institut.horaires[joursSemaine[date.weekday - 1]]?["Ouverture"][0].hour,
      institut.horaires[joursSemaine[date.weekday - 1]]?["Ouverture"][0].minute,
    );
    DateTime fermeture = DateTime(
      date.year,
      date.month,
      date.day,
      institut.horaires[joursSemaine[date.weekday - 1]]?["Ouverture"][1].hour,
      institut.horaires[joursSemaine[date.weekday - 1]]?["Ouverture"][1].minute,
    );

    List<Creneau> creneaux = genererCreneaux(ouverture, fermeture);
    if(!num_semaine.contains(recupererNumeroSemaine(date))){

      setState((){
        num_semaine.add(recupererNumeroSemaine(date));
        taille_semaine.add(creneaux.length);
      });
    }
    else{
      int index = num_semaine.indexOf(recupererNumeroSemaine(date));
      if(creneaux.length > taille_semaine[index]){
        setState((){
          taille_semaine[index] = creneaux.length;
        });
      }
    };

    int index = num_semaine.indexOf(recupererNumeroSemaine(date));
    //print(creneaux);

    return Container(
      height : (taille_semaine[index]*14)+24,
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          Container(
            width: _width/8,
            height: 24,
            decoration: ShapeDecoration(
              //color : Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  texte == "Vide" ? "0" : date.day.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    //height: 0,
                  ),
                ),
              ],
            ),
          ),
          is_opened ? Column(
            children : creneaux.map((creneau){
              return _h_mois(creneau);
            }).toList()
          ) : Expanded(child: _closed(texte))
        ],
      ),
    );
  }

  Widget _closed(String texte){
    return Padding(
      padding : EdgeInsets.only(left : 0, top : 0, right : 0, bottom : 2),
      child: Container(
        width : 35,
        //height : double.maximum,
        decoration: ShapeDecoration(
          color: Color(0xF79B9B9B),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: Center(
          child: Text(
            texte,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontFamily: 'Sora',
              fontWeight: FontWeight.w700,
              //height: 0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _h_mois(Creneau creneau){
    return Padding(
      padding : EdgeInsets.only(left : 0, top : 0, right : 0, bottom : 2),
      child: Container(
        width : 35,
        height : 12,
        decoration: ShapeDecoration(
          color: getColorForEtat(creneau.etat),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            side: creneau.etat == Etat.HC
                ? BorderSide(width: 1, color: Color(0xFF1ABC43))
                : BorderSide.none,
          ),
        ),
        child : Center(
          child: Text(
            '${creneau.creneau.hour}:${creneau.creneau.minute.toString().padLeft(2, '0')}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: creneau.etat == Etat.HC
                  ? Color(0xF71ABC43)
                  : Colors.white,
              fontSize: 8,
              fontFamily: 'Sora',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    //print(semaines);
    return ListView(
      children : [
        //CHIFFRE D'AFFAIRE
        CA("240"),

        //INFOS
        la_legende(),

        Row(
            //crossAxisAlignment : CrossAxisAlignment.start,
        mainAxisAlignment : MainAxisAlignment.center,
          children : [
            IconButton(onPressed: () {
              if(date.month > 1){
                setState((){
                  date = DateTime(date.year, date.month - 1, date.day);
                });
              }
              print(date.month);
            }, icon: Icon(Icons.arrow_back),),
            SizedBox(width : 20),
            Text(
              moisFrancais[date.month - 1],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0.09,
                letterSpacing: -0.41,
              ),
            ),
            SizedBox(width : 20),
            IconButton(onPressed: () {
              if(date.month < 12){
                setState((){
                  date = DateTime(date.year, date.month + 1, date.day);
                });
              }
              print(date.month);
            }, icon: Icon(Icons.arrow_forward),),
          ]
        ),

        Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children : [
            _table_header("", context),
            _table_header("Lun", context),
            _table_header("Mar", context),
            _table_header("Mer", context),
            _table_header("Jeu", context),
            _table_header("ven", context),
            _table_header("Sam", context),
            _table_header("Dim", context),
          ]
        ),
        Container(
          width : double.infinity,
          height : 1,
          color : Colors.grey
        ),
        Column(
            crossAxisAlignment : CrossAxisAlignment.start,
          children: semaines.map((semaine){
            var numero_de_la_semaine;
            for (DateTime? date in semaine) {
              if (date != null) {
                // Action à effectuer sur la première date non nulle
                numero_de_la_semaine = recupererNumeroSemaine(date);
                break; // Sortir de la boucle après avoir trouvé la première date non nulle
              }
            }
            return Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment : MainAxisAlignment.start,
                    crossAxisAlignment : CrossAxisAlignment.start,
                    children : [
                      Padding(
                        padding: const EdgeInsets.only(top : 2),
                        child: Container(
                          width : MediaQuery.of(context).size.width/8,
                          height : 24,
                          decoration : ShapeDecoration(
                            color : Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          ),
                          child : Center(
                            child: Text(
                              '${numero_de_la_semaine}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children : semaine.map((jour){
                          return jour == null ? _table(DateTime.now(), false, context, texte : "Vide") : _table(jour, true, context);
                        }).toList()
                      )
                      /*_table("1", true, context),
                      _table("2", true, context),
                      _table("3", true, context),
                      _table("4", true, context),
                      _table("5", true, context),
                      _table("6", true, context),
                      _table("7", false, context),*/
                    ]
                ),
                Container(
                    width : double.infinity,
                    height : 1,
                    color : Colors.grey
                ),
              ],
            );
          }).toList()
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              // Action à exécuter lors du clic
              print("Container cliqué!");
              /*ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Container cliqué !")),
              );*/
            },
            child: Container(
              width: 379,
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: ShapeDecoration(
                color: Color(0xFF0F72C9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              ),
              child: Text(
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
        ),
      ]
    );
  }
}
