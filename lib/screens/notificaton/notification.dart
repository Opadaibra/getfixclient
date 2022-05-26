import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/Watermark.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/drawer.dart';
import 'package:getfix/screens/notificaton/notificatinbody.dart';

class MyyNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
  
    return Scaffold(
      /*dashboardappbar().Appbarwigit(context),*/
      appBar: AppBar(
          backgroundColor: kprimarycolor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: size.height * 0.1,
          title: LocaleText("notifi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: kbackground, fontWeight: FontWeight.bold))),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          Notificatinbody(),
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
