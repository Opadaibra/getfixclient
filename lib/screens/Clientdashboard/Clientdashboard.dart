import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getfix/Mywidgits/Floatingbutton.dart';
import 'package:getfix/screens/Settings/Settings.dart';
import 'package:getfix/screens/addsite/Addsite.dart';
import 'package:getfix/screens/checkwarrantystate/warranty.dart';
import 'package:getfix/screens/constants/Watermark.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/drawer.dart';
import 'package:getfix/screens/Clientdashboard/dashboardBody.dart';
import 'package:getfix/screens/maintnancerequest/maintnancerequest.dart';
import 'package:getfix/screens/notificaton/notification.dart';
import 'package:getfix/screens/rate/ratemaintenance.dart';

class Clientdashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    Color primary = kprimarycolor;
    Color secondary = ksecondrycolor;
    Color backgroundcolor = kbackground;
    bool paddingfloatbutton = false;
    return Scaffold(
      // backgroundColor: kprimarycolor.withAlpha(50),
      /*dashboardappbar().Appbarwigit(context),*/
      //appBar: dashboardappbar().Appbarwigit(context),
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
      drawer: Workerdrawer(
          size: size,
          primary: primary,
          secondary: secondary,
          backgroundcolor: backgroundcolor),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Floatingbutton(),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          Dashboardbody(),
        ],
      ),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
    );
  }
}
