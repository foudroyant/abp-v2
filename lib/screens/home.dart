import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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

  Widget _rdv_cancel(){
    return Container(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 5),
      child : Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children : [
          Text(
            '15:00',
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
                      'AB User | Balayage + Coloration+ Manucure',
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

  Widget rdv_jaune(){
    return Container(
      width : double.infinity,
      height : 100,
      padding: const EdgeInsets.only(top: 5, left: 10, right: 0, bottom: 5),
      child : Stack(
        children : [
          Positioned(
            top : 10,
            child : Text(
              '10:00',
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
              '10:30',
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
                    'AB User | Balayage + Manucure',
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
            padding: const EdgeInsets.only(top: 15, left: 0, right: 10, bottom: 0),
          width : double.infinity,
          height : 50,
          child : Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children : [0,1,2,3,4,5,6].map((item){
              return GestureDetector(
                onTap : (){

                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                  child: _dates("02", "Lun", true),
                ),
              );
            }).toList()
          )
        ),
        SizedBox(height : 10),
        Container(
          width: double.infinity,
          height: 1,
            decoration: BoxDecoration(color: Color(0xFFE5E5EA))
        ),
        Column(
          children : [
            _creneau_vide("08:00"),
            _rdv_cancel(),
            rdv_jaune()
          ]
        )
      ]
    );
  }
}
