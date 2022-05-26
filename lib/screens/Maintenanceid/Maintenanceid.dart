import 'package:flutter/material.dart';
import 'package:getfix/Mywidgits/Floatingbutton.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/drawer.dart';
import 'package:getfix/screens/Maintenanceid/Maintenanceidbody.dart';

class Maintenanceid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    Color primary = kprimarycolor;
    Color secondary = Theme.of(context).colorScheme.secondary;
    Color backgroundcolor = kbackground;
    return Scaffold(
      appBar: Customeappbar(),
      body: Maintenanceidbody(),
      floatingActionButton: Floatingbutton(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawer: Workerdrawer(
          size: size,
          primary: primary,
          secondary: secondary,
          backgroundcolor: backgroundcolor),
    );
  }
}
