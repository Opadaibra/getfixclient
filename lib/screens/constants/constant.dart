import 'package:flutter/material.dart';

Color kprimarycolor = Color(0xFF37506C);
Color ksecondrycolor = Color(0xFFFF715A);
Color kdefaultshadow = Colors.black12.withAlpha(50);
Color kbackground = Colors.white;
Color kerror = Colors.red;
double kdefaultpadding = 20.0;
double kdefaultradius = 36.0;

class Manger {
  TextStyle styleofText(Color color, bool isshadow, double fontsize,
      BuildContext context, bool isbold) {
    return TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
      shadows: isshadow ? [Shadow(blurRadius: 0, offset: Offset(1, 1))] : null,
    );
  }

  SizedBox sizedBox(double width, double height, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(width: size.width * width, height: size.height * height);
  }

  bool getx(bool x) {
    return x;
  }

  Size getsize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}

/* 
final containersbackground = Colors.white;
final hidline1textstyle = TextStyle(
  color: secondarycolor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'SmoochSans',
  shadows: [Shadow(blurRadius: 20, color: Colors.grey, offset: Offset(5, 5))],
);
final hidline3textStyle = TextStyle(
  color: secondarycolor,
  fontSize: 12,
  fontWeight: FontWeight.bold,
  fontFamily: 'SmoochSans',
  shadows: [Shadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))],
);
final hidline4textStyle = TextStyle(
  color: secondarycolor,
  fontSize: 12,
  //fontWeight: FontWeight.bold,
  fontFamily: 'SmoochSans',
  // shadows: [Shadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))],
);
final hintStyle = TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    letterSpacing: 1);
final buttontext = TextStyle(
    color: containersbackground, fontSize: 15, fontWeight: FontWeight.bold);
final whitebuttontext =
    TextStyle(color: secondarycolor, fontSize: 15, fontWeight: FontWeight.bold);
final pincodestyle =
    TextStyle(color: secondarycolor, fontSize: 25, fontWeight: FontWeight.bold);
*/