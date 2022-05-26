//Sign BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
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
        headline(context),
        padding2(size, 0.05),
        machin(context, size),
        padding2(size, 0.01),
      ],
    ));
  }

  Row machin(BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset(
            "Images/freazer.png",
            color: arr[0] == true
                ? kprimarycolor
                : Theme.of(context).colorScheme.secondary,
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
            color: arr[1] == true
                ? kprimarycolor
                : Theme.of(context).colorScheme.secondary,
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
            color: arr[2] == true
                ? kprimarycolor
                : Theme.of(context).colorScheme.secondary,
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
