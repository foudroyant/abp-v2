import 'package:flutter/material.dart';


class Drawer extends StatefulWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Column(
        children : [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/48x48"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.22),
                ),
              ),
            ),
            Column(
              children : [
                Text(
                  'AB SALON MANAGER',
                  style: TextStyle(
                    color: Color(0x66242220),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.18,
                    letterSpacing: 0.40,
                  ),
                ),
                Text(
                  'Andrew Smith',
                  style: TextStyle(
                    color: Color(0xFF232120),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
              ]
            ),

            Transform(
              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
              child: Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 6,
                  right: 6,
                  bottom: 9.20,
                ),
                decoration: ShapeDecoration(
                  color: Color(0x8EFFECE0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50, color: Color(0x51F5EFEB)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Center(child: Icon(Icons.add))
              ),
            )
          ],
        ),
          Opacity(
            opacity: 0.24,
            child: Container(
              width: 256,
              height: 0.50,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0, 1),
                  radius: 0,
                  colors: [Color(0xFF422B2B), Color(0x004F1B1B)],
                ),
              ),
            ),
          ),

          Container(
            width: 208,
            height: 24,
            padding: const EdgeInsets.only(left: 20, right: 4),
            child: Text(
              'MENU',
              style: TextStyle(
                color: Color(0x66242220),
                fontSize: 11,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0.20,
                letterSpacing: 0.40,
              ),
            ),
          ),

          Container(
            width: 226,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0x0A242220),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0x28F5EFEB),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          )
        ]
      )
    );
  }
}
