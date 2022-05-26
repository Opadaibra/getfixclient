//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/titleoftextfield.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ratemaintenancebody extends StatefulWidget {
  @override
  _RatemaintenancebodyState createState() => _RatemaintenancebodyState();
}

class _RatemaintenancebodyState extends State<Ratemaintenancebody> {
  var preesedstar = [false, false, false, false, false];
  double _rating = 0.0;
  String ratetext = "";
  TextEditingController _teamnumbercontroller = new TextEditingController();
  TextEditingController _notescontroller = new TextEditingController();
  Color gradiant = Color(0xFF053F5E);
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 40)),
          Container(
            width: size.width,
            height: size.height * 0.25,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kprimarycolor.withOpacity(0.8),
            ),
            child: Stack(
              children: [
                Container(
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                  alignment: Alignment.center,
                  child: LocaleText(
                    "fillrate",
                    style: TextStyle(
                        color: kprimarycolor, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      color: ksecondrycolor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                ),
                Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    padding2(size, 0.05),
                    //padding2(size, 0.05),
                    Container(
                      padding:
                          EdgeInsetsDirectional.only(start: size.width * 0.05),
                      width: size.width * 0.8,
                      child: TextField(
                        style: TextStyle(color: kbackground),
                        decoration: InputDecoration(
                          hintText: Locales.string(context, "teamno"),
                          hintStyle:
                              TextStyle(color: kbackground, fontSize: 12),
                        ),
                        minLines: 1,
                        maxLines: 5,
                        controller: _teamnumbercontroller,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsetsDirectional.only(start: size.width * 0.05),
                      width: size.width * 0.8,
                      child: TextField(
                        style: TextStyle(color: kbackground),
                        decoration: InputDecoration(
                          hintText: Locales.string(context, "notes"),
                          hintStyle:
                              TextStyle(color: kbackground, fontSize: 12),
                        ),
                        textAlign: TextAlign.start,
                        minLines: 1,
                        maxLines: 5,
                        controller: _notescontroller,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 40))
                  ],
                ),
              ],
            ),
          ),
          //padding2(size, 0.1),
          Container(
            width: size.width,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kprimarycolor.withOpacity(.8),
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 40)),

                ratestars(),
                // header(size, context),

                rateingpercent(context),
                rettingtext(context),
                Padding(padding: EdgeInsets.only(bottom: 40)),
              ],
            ),
          ),

          sendbutton(size, context)
        ],
      ),
    );
  }

  Text rettingtext(BuildContext context) {
    return Text(ratetext,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: gradiant,
            ));
  }

  Row rateingpercent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
            minRating: 0,
            allowHalfRating: true,
            maxRating: 5,

            //      glow: true,
            glowColor: kprimarycolor,
            updateOnDrag: true,
            unratedColor: kprimarycolor,
            itemBuilder: (context, _) =>
                Icon(Icons.star_rounded, color: gradiant),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
                if (rating <= 1) {
                  gradiant = Colors.red;
                  ratetext = Locales.lang == "en" ? "Bad" : "سيء";
                }
                if (rating > 1 && rating <= 2) {
                  gradiant = Color.fromARGB(255, 255, 171, 44);
                  ratetext = Locales.lang == "en" ? "Accept" : "مقبول";
                }
                if (rating > 2 && rating <= 3) {
                  gradiant = Colors.amber;
                  ratetext = Locales.lang == "en" ? "Good" : "جيد";
                }
                if (rating > 3 && rating <= 4) {
                  gradiant = Colors.lightGreen;
                  ratetext = Locales.lang == "en" ? "Verygood" : "جيد جداً";
                }
                if (rating > 4) {
                  gradiant = Color.fromARGB(255, 5, 241, 12);
                  ratetext = Locales.lang == "en" ? "Excellant" : "ممتاز";
                }
              });
            }),
        Text("  $_rating",
            style: Manger().styleofText(
              gradiant,
              false,
              18,
              context,
              true,
            ))
      ],
    );
  }

  Container ratestars() {
    return Container(
        /* Row(children: [
       //       IconButton(onPressed: onPressed, icon: Icon(Icons))
            ],)*/
        );
  }

  Row sendbutton(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 20,
                offset: Offset(0, 5),
                color: kprimarycolor.withOpacity(0.8))
          ]),
          width: size.width * 0.5,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kprimarycolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)),
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
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: kprimarycolor,
                  duration: Duration(seconds: 2),
                  content: _rating > 0 &&
                          _teamnumbercontroller.text.isNotEmpty &&
                          _notescontroller.text.isNotEmpty
                      ? Text(Locales.lang == "en"
                          ? "rate has been sent successfully 👍"
                          : "تم إرسال التقييم بنجاح 👍")
                      : Text(Locales.lang == "en"
                          ? "Please fill empty fields  first"
                          : "الرجاء املأ الحقول الفارغة أولا"),
                ));
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
      child: LocaleText('rate',
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
