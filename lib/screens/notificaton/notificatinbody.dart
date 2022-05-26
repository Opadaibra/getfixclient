//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';

class Notificatinbody extends StatefulWidget {
  @override
  _NotificatinbodyState createState() => _NotificatinbodyState();
}

class _NotificatinbodyState extends State<Notificatinbody> {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    return SingleChildScrollView(
      child: Container(),
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
