//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/LogIn/LoginPage.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/titleoftextfield.dart';

class Logoutbody extends StatefulWidget {
  @override
  _LogoutbodyState createState() => _LogoutbodyState();
}

class _LogoutbodyState extends State<Logoutbody> {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            padding2(size, 0.05),
            header(size, context),
            Titleoftextfield(context: context, title: "cause"),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.75,
              child: TextField(
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(),
              ),
            ),
            padding2(size, 0.1),
            sendbutton(size, context)
          ],
        ),
      ),
    );
  }

  Row sendbutton(Size size, BuildContext context) {
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
              setState(() {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new LoginPage()));
              });
            },
          ),
        )
      ],
    );
  }

  Container header(Size size, BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: EdgeInsetsDirectional.only(start: size.width * 0.04),
      child: LocaleText('logout',
          textAlign: TextAlign.right,
          style: Manger().styleofText(
            kprimarycolor,
            false,
            size.width * 0.05,
            context,
            true,
          )),
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
