//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/titleoftextfield.dart';

class Endamaintenancebody extends StatefulWidget {
  @override
  _EndamaintenancebodyState createState() => _EndamaintenancebodyState();
}

class _EndamaintenancebodyState extends State<Endamaintenancebody> {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            padding2(size, 0.05),
            header(size, context),
            Titleoftextfield(context: context, title: "reqno"),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.75,
              child: TextField(
                textAlign: TextAlign.right,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(),
              ),
            ),

            Titleoftextfield(context: context, title: "usedtool"),
            Transform.translate(
              offset: Offset(0, -10),
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.75,
                child: TextField(
                  minLines: 1,
                  maxLines: 5,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(),
                ),
              ),
            ),
            Titleoftextfield(context: context, title: "repair"),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.75,
              child: TextField(
                minLines: 1,
                maxLines: 5,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.camera_enhance_rounded)
                    ),
              ),
            ),
            Titleoftextfield(context: context, title: "tocost"),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.75,
              child: TextField(
                minLines: 1,
                maxLines: 5,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.camera_enhance_rounded)
                    ),
              ),
            ),
            Titleoftextfield(context: context, title: "notes"),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.75,
              child: TextField(
                minLines: 1,
                maxLines: 5,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.camera_enhance_rounded)
                    ),
              ),
            ),
            padding2(size, 0.1),
            sendbuton(size, context)
            // Container(
            //   child: Image.asset(
            //     'Images/hafez.png',
            //     color: Colors.grey[200],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Row sendbuton(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: size.width * 0.2,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kprimarycolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: kprimarycolor,
                    width: .5,
                  ),
                ),
              ),
            ),
            child: LocaleText(
              "send",
              style: Manger().styleofText(
                  kbackground, false, size.width * 0.04, context, true),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
        )
      ],
    );
  }

  Row header(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.04),
          alignment: Alignment.topRight,
          child: LocaleText('endmaint',
              textAlign: TextAlign.right,
              style: Manger().styleofText(
                kprimarycolor,
                false,
                size.width * 0.05,
                context,
                true,
              )),
        ),
      ],
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
