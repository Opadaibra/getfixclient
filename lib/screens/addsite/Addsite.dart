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
    return Scaffold(
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
      ), //ustomeappbar(),
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
          primary: kprimarycolor,
          secondary: ksecondrycolor,
          backgroundcolor: kbackground),
    );
  }
}
