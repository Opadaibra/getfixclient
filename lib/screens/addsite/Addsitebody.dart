//dashboard BODY

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/Mywidgits/modifedappbar.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/constants/titleoftextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

int sitecount = 0;

class Addsitebody extends StatefulWidget {
  @override
  _AddsitebodybodyState createState() => _AddsitebodybodyState();
}

var _selectedgovernorate;
var _selectedcity;
List governorates2 = [];
List<String> mysite = [];

class _AddsitebodybodyState extends State<Addsitebody> {
  bool enabled = true;

  String errormessage = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmysite();
  }

  @override
  Widget build(BuildContext context) {
    List governorates = [
      "دمشق",
      "درعا",
      "السويداء",
      "حمص",
      "طرطوس",
      "اللاذقية",
      "حلب",
      "الحسكة",
      "الرقة",
      "دير الزور"
    ];
    Size size = Manger().getsize(context);

    List cities = [
      "ضاحية اليرموك",
      "السحاري ",
      "الكاشف",
      "حي القصور",
      "الكاشف",
      "المطار",
      "شمال الخط"
    ];
    //List _ad = [LocaleText("")];

    return SingleChildScrollView(
      child: Column(
        children: [
          //header(size, context),
          modiefedappbar(
              size: size,
              widgiticon: Icon(
                Icons.location_on,
                size: size.width * 0.12,
                color: kbackground,
              ),
              localeText: LocaleText(
                "site",
                style: TextStyle(
                    color: kbackground,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05),
              )),
          // Titleoftextfield(context: context, title: "governorate"),
          defaultpadd,
          governoratechoose(size, governorates, cities),

          // Titleoftextfield(context: context, title: "city"),
          defaultpadd,
          citychoose(size, cities),
          Container(
            alignment: Alignment.center,
            width: size.width * .9,
            child: TextField(
              minLines: 1,
              maxLines: 5,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  hintText: Locales.string(context, "street")
                  // prefixIcon: Icon(Icons.camera_enhance_rounded)
                  ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width * .9,
            child: TextField(
              minLines: 1,
              maxLines: 5,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  hintText: Locales.string(context, "buildingadd")
                  // prefixIcon: Icon(Icons.camera_enhance_rounded)
                  ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width * .9,
            child: TextField(
              minLines: 1,
              maxLines: 5,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  hintText: Locales.string(context, "buildingno")
                  // prefixIcon: Icon(Icons.camera_enhance_rounded)
                  ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width * .9,
            child: TextField(
              minLines: 1,
              maxLines: 5,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  hintText: Locales.string(context, "floorno")
                  // prefixIcon: Icon(Icons.camera_enhance_rounded)
                  ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          sendbutton(size, context)
        ],
      ),
    );
  }

  Container governoratechoose(Size size, List _governorates, List cities) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kbackground,
          boxShadow: [
            BoxShadow(
                color: ksecondrycolor, blurRadius: 20, offset: Offset(0, 10))
          ]),
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(18),

          iconEnabledColor: kprimarycolor,
          icon: Icon(
            Icons.expand_circle_down_rounded,
            size: size.width * 0.1,
          ),
          //    menuMaxHeight: size.height * 0.5,
          //itemHeight: size.height * 0.2,
          isExpanded: true,
          style: Manger().styleofText(kprimarycolor, false, 14, context, true),
          value: _selectedgovernorate,
          onChanged: (newvalue) async {
            setState(() {
              _selectedgovernorate = newvalue;
              updatecitylist(cities, _selectedgovernorate);
            });
          },
          items: _governorates.map((governate) {
            return DropdownMenuItem(
              child: Text(
                governate,
                style: TextStyle(wordSpacing: 5),
              ),
              value: governate,
            );
          }).toList(),
          hint: LocaleText(
            "governorate",
            style: TextStyle(color: kprimarycolor),
          ),
        ),
      ),
    );
  }

  void updatecitylist(List cities, var governant) {
    if (governant == Locales.string(context, "dammascus")) {
      print(" حيو الشام لك عمي");
    }
    if (governant == Locales.string(context, "daraa")) {
      print(" ولك عراسي الدراعنة");
    }
    if (governant == Locales.string(context, "homs")) {
      print(" اهلييين والله بحووومص");
    }
  }

  Container citychoose(Size size, List<dynamic> _cities) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kbackground,
          boxShadow: [
            BoxShadow(
                color: ksecondrycolor, blurRadius: 20, offset: Offset(0, 10))
          ]),
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(18),
          isExpanded: true,
          // isDense: true,
          icon: Icon(
            Icons.expand_circle_down_rounded,
            size: size.width * 0.1,
          ),
          iconEnabledColor: kprimarycolor,
          style: Manger().styleofText(kprimarycolor, false, 14, context, true),
          menuMaxHeight: size.height * 0.5,
          value: _selectedcity,
          onChanged: (newvalue) async {
            setState(() {
              _selectedcity = newvalue;
            });
          },
          items: _cities.map((city) {
            return DropdownMenuItem(
              child: Text(
                city,
                style: TextStyle(wordSpacing: 5),
              ),
              value: city,
            );
          }).toList(),
          hint: LocaleText("city", style: TextStyle(color: kprimarycolor)),
        ),
      ),
    );
  }

  Container header(Size size, BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: EdgeInsetsDirectional.only(start: size.width * 0.04),
      child: LocaleText('addsite',
          textAlign: TextAlign.start,
          style: Manger().styleofText(
            kprimarycolor,
            false,
            size.width * 0.05,
            context,
            true,
          )),
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
            onPressed: !enabled
                ? null
                : () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();

                    if (_selectedgovernorate != null && _selectedcity != null) {
                      String currentsite =
                          "$_selectedgovernorate,$_selectedcity";

                      if (check(currentsite)) {
                        if (sitecount < 4)
                          mysite.add(currentsite);
                        else if (sitecount >= 4) mysite.last = currentsite;
                        errormessage = Locales.lang == "en"
                            ? "Site has been add successfully✔"
                            : "تم إضافة الموقغ بنجاح ✔";
                      } else
                        errormessage = Locales.lang == "en"
                            ? "Sorry! this Site is already exist ⚠ "
                            : "عذراً! هذا الموقع موجود بالفعل ⚠";
                      pref.setStringList("key", mysite);

                      setState(() {
                        enabled = false;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: kprimarycolor,
                              content: Text(errormessage,
                                  style: Manger().styleofText(
                                      kbackground, false, 16, context, false))),
                        );
                      });
                      Timer(Duration(seconds: 1),
                          () => setState(() => enabled = true));
                      //pref.remove("key");
                    }
                  },
            child: LocaleText(
              "add",
              style: Manger().styleofText(
                  kbackground, false, size.width * 0.04, context, true),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  bool check(String curren) {
    for (var i = 0; i < sitecount; i++) {
      if (mysite[i] == curren) return false;
    }
    return true;
  }

  getmysite() async {
    if (mysite != null) {
      sitecount = mysite.length;
    } else
      sitecount = 0;
  }
}
