import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';
class modiefedappbar extends StatelessWidget {
  const modiefedappbar({
    Key? key,
    required this.size,
    required this.widgiticon,
    required this.localeText,
  }) : super(key: key);

  final Size size;
  final Icon widgiticon;
  final LocaleText localeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      width: size.width,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, -2),
            child: Container(
              height: size.height * 0.1 - 20,
              //    margin: EdgeInsetsDirectional.only(end: size.width * 0.25),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
                color: kprimarycolor,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: Offset(-size.width * 0.3, -size.height * 0.025),
                child: Container(
                  // width: size.width * 0.25,
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.38),
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(120)),
                      color: kbackground),
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Transform.translate(
                offset: Offset(-size.width * 0.3, 10),
                child: Container(
                  // width: size.width * 0.25,
                  //alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.4),
                  height: size.height * 0.09,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 30, color: kprimarycolor)
                      ],
                      borderRadius: BorderRadius.circular(100),
                      color: kprimarycolor),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: widgiticon,
                  ),
                )),
          ),
          Positioned(
              left: size.width * 0.35,
              bottom: size.height * 0.03,
              child: localeText)
        ],
      ),
    );
  }
}
