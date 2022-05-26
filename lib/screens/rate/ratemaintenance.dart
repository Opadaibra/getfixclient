import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/rate/ratemaintenancebody.dart';
import 'package:flutter/material.dart';
import 'package:getfix/screens/constants/Watermark.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/drawer.dart';

class Ratemaintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    Color primary = kprimarycolor;
    Color secondary = ksecondrycolor;
    Color backgroundcolor = kbackground;
    return Scaffold(
      /*dashboardappbar().Appbarwigit(context),*/
      /*appBar: AppBar(
          backgroundColor: kprimarycolor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
          ),
          elevation: 10,
          automaticallyImplyLeading: false,
          toolbarHeight: size.height * 0.1,
          title: LocaleText("rate",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: kbackground, fontWeight: FontWeight.bold))),
      */
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          Ratemaintenancebody(),
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
