import 'package:flutter/material.dart';

class  Item_Team extends StatelessWidget {
  final bool is_connected;
  const Item_Team ({required this.is_connected});

  @override
  Widget build(BuildContext context) {
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
}
