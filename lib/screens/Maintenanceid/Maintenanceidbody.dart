//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';

class Maintenanceidbody extends StatefulWidget {
  @override
  _MaintenanceidbodyState createState() => _MaintenanceidbodyState();
}

class _MaintenanceidbodyState extends State<Maintenanceidbody> {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            padding2(size, 0.01),
            Container(
              padding: EdgeInsetsDirectional.only(start: size.width * 0.04),
              alignment: AlignmentDirectional.topStart,
              child: LocaleText('maintenanceid',
                  textAlign: TextAlign.right,
                  style: Manger().styleofText(
                    kprimarycolor,
                    false,
                    size.width * 0.05,
                    context,
                    true,
                  )),
            ),
            padding2(size, 0.1),
          ],
        ),
      ),
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
