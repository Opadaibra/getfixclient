import 'package:getfix/Mywidgits/Floatingbutton.dart';
import 'package:getfix/screens/Usertutorialguide/Usertutorialguidebody.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/drawer.dart';
import 'package:flutter/material.dart';
import 'package:getfix/screens/constants/Watermark.dart';

class Usertutorialguide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    Color primary = kprimarycolor;
    Color secondary = Theme.of(context).colorScheme.secondary;
    Color backgroundcolor = kbackground;
    return Scaffold(
      floatingActionButton: Floatingbutton(),

      /*dashboardappbar().Appbarwigit(context),*/
      //appBar: dashboardappbar().Appbarwigit(context),
      appBar: Customeappbar(),

      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          Usertutorialguidebody(),
        ],
      ),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,

      drawer: Workerdrawer(
          size: size,
          primary: primary,
          secondary: secondary,
          backgroundcolor: backgroundcolor),
    );
  }
}
