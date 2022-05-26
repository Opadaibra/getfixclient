

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getfix/screens/addsite/Addsite.dart';
import 'package:getfix/screens/checkwarrantystate/warranty.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/maintnancerequest/maintnancerequest.dart';
import 'package:getfix/screens/notificaton/notification.dart';
import 'package:getfix/screens/rate/ratemaintenance.dart';

class Floatingbutton extends StatelessWidget {
  const Floatingbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: kprimarycolor,
      //  foregroundColor: backgroundcolor.withOpacity(0.25),
      animatedIcon: AnimatedIcons.menu_close,
      //   elevation: 0, direction: SpeedDialDirection.right,
      //onOpen: () => {paddingfloatbutton = true},
      //  childPadding: EdgeInsets.only(left: 50),
      children: [
        SpeedDialChild(
            onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Ratemaintenance())),
            child: Icon(
              Icons.star,
              color: kbackground,
            ),
            backgroundColor: ksecondrycolor),
        SpeedDialChild(
            onTap: (() => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new MyyNotification()))),
            child: Icon(
              Icons.notifications,
              color: kbackground,
            ),
            backgroundColor: ksecondrycolor),
        SpeedDialChild(
            //label: "asds",
            labelStyle: TextStyle(),
            onTap: (() => Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Addsite()))),
            child: Icon(
              Icons.location_on_rounded,
              color: kbackground,
            ),
            backgroundColor: ksecondrycolor),
        SpeedDialChild(
            onTap: (() => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Maintnancerequest()))),
            child: Icon(
              Icons.precision_manufacturing_rounded,
              color: kbackground,
            ),
            backgroundColor: ksecondrycolor),
        SpeedDialChild(
            onTap: (() => Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new warranty()))),
            labelStyle: TextStyle(),
            child: Icon(
              Icons.qr_code,
              color: kbackground,
            ),
            backgroundColor: ksecondrycolor),
      ],
    );
  }
}
