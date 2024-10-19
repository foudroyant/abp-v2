import 'package:abp/components/ui_element.dart';
import 'package:flutter/material.dart';

class Mois extends StatefulWidget {
  const Mois({Key? key}) : super(key: key);

  @override
  State<Mois> createState() => _MoisState();
}

class _MoisState extends State<Mois> {

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

  Widget _table(String texte, bool is_opened, BuildContext context){
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height : (9*14)+24,
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        //crossAxisAlignment : CrossAxisAlignment.start,
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
              ],
            ),
          ),
          is_opened ? Column(
            children : [
              _h_mois('9:00'),
              _h_mois('9:00'),
              _h_mois('9:00'),
              _h_mois('9:00'),
              _h_mois('9:00'),
              _h_mois('9:00'),
              _h_mois('9:00'),
              _h_mois('9:00'),
              _h_mois('9:00'),
            ]
          ) : Expanded(child: _closed("Fermé"))
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
              height: 0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _h_mois(String texte){
    return Padding(
      padding : EdgeInsets.only(left : 0, top : 0, right : 0, bottom : 2),
      child: Container(
        width : 35,
        height : 12,
        decoration: ShapeDecoration(
          color: Color(0xF71ABC43),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child : Center(
          child: Text(
            texte,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
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
            IconButton(onPressed: () {  }, icon: Icon(Icons.add),),
            SizedBox(width : 20),
            Text(
              'Avril ',
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
            IconButton(onPressed: () {  }, icon: Icon(Icons.add),),
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
          children: [0,1,2,3].map((item){
            return Column(
              children: [
                Row(
                  //mainAxisAlignment : MainAxisAlignment.start,
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
                              '14',
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
                      _table("1", true, context),
                      _table("2", true, context),
                      _table("3", true, context),
                      _table("4", true, context),
                      _table("5", true, context),
                      _table("6", true, context),
                      _table("7", false, context),
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
