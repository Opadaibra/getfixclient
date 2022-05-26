//Sign BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/Mywidgits/modifedappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class Usertutorialguidebody extends StatefulWidget {
  @override
  _UsertutorialguidebodyState createState() => _UsertutorialguidebodyState();
}

class _UsertutorialguidebodyState extends State<Usertutorialguidebody> {
  // ignore: deprecated_member_use
  var arr = [false, false, false];
  @override
  var _selectedorder;
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    var divider = Divider(
      color: kprimarycolor,
      thickness: 2,
      height: 10,
    );
    return SingleChildScrollView(
        child: Column(
      children: [
        modiefedappbar(
            size: size,
            widgiticon: Icon(
              Icons.library_books_rounded,
              size: size.width * 0.12,
              color: kbackground,
            ),
            localeText: LocaleText(
              "usertut",
              style: TextStyle(
                  color: kbackground,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05),
            )),
        //headline(context),
        padding2(size, 0.05),
        machin(context, size),
        padding2(size, 0.01),
      ],
    ));
  }

  Container machin(BuildContext context, Size size) {
    return Container(
      child: Column(
        children: [
          Container(
            height: size.height * 0.25,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kbackground,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: ksecondrycolor,
                      offset: Offset(0, 10))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    "Images/freazer.png",
                    color: arr[0] == true ? kprimarycolor : ksecondrycolor,
                  ),
                  onPressed: () {
                    setState(() {
                      arr = [!arr[0], false, false];
                    });
                  },

                  iconSize: size.width * 0.2,
                  splashRadius: size.width * 0.1,
                  highlightColor: kprimarycolor,

                  //   splashColor: kprimarycolor,
                ),
                IconButton(
                  icon: Image.asset(
                    "Images/wachmachine.png",
                    color: arr[1] == true ? kprimarycolor : ksecondrycolor,
                  ),
                  onPressed: () {
                    setState(() {
                      arr = [false, !arr[1], false];
                      //  wachmachin = !wachmachin;
                    });
                  },
                  iconSize: size.width * 0.2,
                  splashRadius: size.width * 0.1,
                  highlightColor: kprimarycolor,
                ),
                IconButton(
                  icon: Image.asset(
                    "Images/aircooler.png",
                    color: arr[2] == true ? kprimarycolor : ksecondrycolor,
                  ),
                  onPressed: () {
                    setState(() {
                      // aircooler = !aircooler;
                      arr = [false, false, !arr[2]];
                    });
                  },
                  iconSize: size.width * 0.2,
                  splashRadius: size.width * 0.1,
                  highlightColor: kprimarycolor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container headline(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 10, top: 10),
      child: LocaleText(
        "choosetut",
        textAlign: TextAlign.start,
        style: Manger().styleofText(kprimarycolor, false, 20, context, false),
      ),
    );
  }

  bool anybuttonpressed() {
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] == true) return true;
    }
    return false;
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
