import 'package:flutter/material.dart';
import 'package:getfix/screens/checkwarrantystate/warrantystatebody.dart';
import 'package:getfix/screens/constants/Watermark.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/drawer.dart';

class warranty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    Color primary = kprimarycolor;
    Color secondary = ksecondrycolor;
    Color backgroundcolor = kbackground;
    return Scaffold(
      /*dashboardappbar().Appbarwigit(context),*/
      appBar: AppBar(
        title: Image.asset(
          innerGreenGetFix,
          width: size.width * 0.6,
        ),
        centerTitle: true,
        backgroundColor: kprimarycolor,
        toolbarHeight: size.height * 0.15,
        automaticallyImplyLeading: false,
        elevation: 0,
      ), //Customeappbar(),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          warrantystatebody(),
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
