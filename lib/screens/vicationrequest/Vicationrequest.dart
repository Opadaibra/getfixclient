import 'package:flutter/material.dart';
import 'package:getfix/screens/constants/Watermark.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/drawer.dart';
import 'package:getfix/screens/vicationrequest/Vicationrequestbody.dart';

class Vicationrequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    Color primary = kprimarycolor;
    Color secondary = Theme.of(context).colorScheme.secondary;
    Color backgroundcolor = kbackground;
    return Scaffold(
      /*dashboardappbar().Appbarwigit(context),*/
      appBar: Customeappbar(),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          Vicationrequestbody(),
        ],
      ),
      drawer: Workerdrawer(
          size: size,
          primary: primary,
          secondary: secondary,
          backgroundcolor: backgroundcolor),
    );
  }
}
