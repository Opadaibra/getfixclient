import 'package:getfix/screens/addsite/Addsitebody.dart';
import 'package:flutter/material.dart';
import 'package:getfix/screens/constants/Watermark.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/drawer.dart';

class Addsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    Color primary = kprimarycolor;
    Color secondary = Theme.of(context).colorScheme.secondary;
    Color backgroundcolor = kbackground;
    return Scaffold(
      appBar: Customeappbar(),
      // dashboardappbar().Appbarwigit(context),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          Addsitebody(),
        ],
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,

      drawer: Workerdrawer(
          size: size,
          primary: primary,
          secondary: secondary,
          backgroundcolor: backgroundcolor),
    );
  }
}
