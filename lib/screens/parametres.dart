import 'package:flutter/material.dart';

import '../components/ui_element.dart';

class Parametres extends StatefulWidget {
  const Parametres({Key? key}) : super(key: key);

  @override
  State<Parametres> createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      children: [
        Container(
          height: 425, //475,
          width : double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 301,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                child : Column(
                  children : [
                    Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children : [
                            Switch(
                              value: true,
                              onChanged: (_value){},
                              activeTrackColor: Colors.white,  // Couleur de la piste quand actif
                              activeColor: Colors.black,            // Couleur du cercle quand actif
                            ),
                            Text(
                              'Manager',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]
                        ),
                        Row(
                            children : [
                              _image([48,34], "eye.png"),
                              _image([48,34], "help.png"),
                            ]
                        )
                      ],
                    ),
                    _image([80,60], "user_ellipse.png"),
                    Center(
                      child : Column(
                        children: [
                          Text(
                            'Nom Manager',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height : 10),
                          Text(
                            'Profil Active',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xF731C055),
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height : 10),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Code membre',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' : ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '01020350258 ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ]
                )
              ),
              Positioned(
                top : 200,
                left : (_screenWidth - 350) / 2,
                child : Row(
                  children: [
                    Container(
                      width: 349,
                      height: 190,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child : Column(
                          mainAxisAlignment : MainAxisAlignment.center,
                        children : [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'CA. ',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '24 000 €',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                              mainAxisAlignment : MainAxisAlignment.center,
                            children : [
                              _image([8,15], "up.png"),
                              _roboto_400("48", 15),
                              SizedBox(width : 5),

                              _image([21,20], "late.png"),
                              _roboto_400("38", 15),
                              SizedBox(width : 5),

                              _image([8,15], "down.png"),
                              _roboto_400("10", 15),
                              SizedBox(width : 5),

                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'TDF. ',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '+ 24 %',
                                      style: TextStyle(
                                        color: Color(0xFF26A646),
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                          ),
                          SizedBox(height : 10),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Contact',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.30000001192092896),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '  +00 00 10 00 02 01\n',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'SIRET ',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.30000001192092896),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 10 02 03 55 74 15 33 61\n',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Adresse',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.30000001192092896),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '  02 Non de la rue, 99 999 Ville - PAYS',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height : 5),
                          separateur(314),
                          SizedBox(height : 10),
                          Text(
                            'Consulter le guide d’utilisation ABP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]
                      )
                    ),
                  ],
                )
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left : 15),
          child: Column(
            children : [
              Text(
                'Informations',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              _item_menu("","'Gestion de compte PRO'")
            ]
          ),
        )
      ],
    );
  }

  Widget _image(List<double> dim, String src){
    return Container(
      width: dim[0],
      height: dim[1],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${src}"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _item_menu(String src_image, String texte){
    return Row(
      children : [
        Container(
          width: 20,
          height: 21,
          padding: const EdgeInsets.only(
            top: 0.88,
            left: 0.83,
            right: 0.83,
            bottom: 0.87,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/${src_image}"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          texte,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ]
    );
  }

  Widget _roboto_400(String texte, double size){
    return Text(
      texte,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
