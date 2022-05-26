//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/Mywidgits/modifedappbar.dart';
import 'package:getfix/screens/constants/constant.dart';

class Maintenanceidbody extends StatefulWidget {
  @override
  _MaintenanceidbodyState createState() => _MaintenanceidbodyState();
}

class _MaintenanceidbodyState extends State<Maintenanceidbody> {
  
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    var widgiticon = Icon(
                              Icons.numbers_rounded,
                              color: kbackground,
                              size: size.width * 0.1,
                            );
    var localeText = LocaleText(
                        "maintenanceid",
                        style: TextStyle(
                            color: kbackground,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.05),
                      );
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            modiefedappbar(size: size, widgiticon: widgiticon, localeText: localeText),
            padding2(size, 0.1),
          ],
        ),
      ),
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}

