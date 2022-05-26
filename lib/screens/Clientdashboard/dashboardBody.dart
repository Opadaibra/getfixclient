//Sign BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class Dashboardbody extends StatefulWidget {
  @override
  _DashboardbodyState createState() => _DashboardbodyState();
}

class _DashboardbodyState extends State<Dashboardbody> {
  // ignore: deprecated_member_use
  var arr = [false, false, false];
  @override
  var order = [
    Locales.lang == "en" ? "Old" : "الأقدم",
    Locales.lang == "en" ? "New" : "الأحدث"
  ];

  var _selectedorder;
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    var divider = Divider(
      color: kprimarycolor,
      thickness: 2,
      height: 10,
    );
    return Column(
      children: [
        Container(
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
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.38),
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(120)),
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
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.4),
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 30, color: kprimarycolor)
                          ],
                          borderRadius: BorderRadius.circular(100),
                          color: kprimarycolor),
                      child: IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: Icon(
                          Icons.home,
                          color: kbackground,
                          size: size.width * 0.1,
                        ),
                      ),
                    )),
              ),
              Positioned(
                  left: size.width * 0.5,
                  bottom: size.height * 0.03,
                  child: LocaleText(
                    "showtasks",
                    style: TextStyle(
                        color: kbackground,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05),
                  ))
            ],
          ),
        ),
        Column(
          children: [
            //  headline(context),
            padding2(size, 0.05),
            machin(context, size),
            padding2(size, 0.01),
          ],
        ),
        Expanded(child: body(size))
      ],
    );
  }

  ListView body(Size size) {
    return ListView(
      children: [
        vewingorders(context),
        Container(child: arr[0] ? orders(1, size) : null),
        Container(child: arr[1] ? orders(1, size) : null),
        Container(child: arr[2] ? orders(1, size) : null),
      ],
    );
  }

  Container vewingorders(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.topStart,
        padding: EdgeInsetsDirectional.only(start: 10, top: 10),
        child: anybuttonpressed()
            ? ListTile(
                title: LocaleText(
                  "orasd",
                  style: Manger()
                      .styleofText(kprimarycolor, false, 18, context, false),
                  textAlign: TextAlign.start,
                ),
                trailing: DropdownButton(
                  value: _selectedorder,
                  onChanged: (newvalue) async {
                    setState(() {
                      _selectedorder = newvalue;
                    });
                  },
                  items: order.map((orderhead) {
                    return DropdownMenuItem(
                      child: new Text(orderhead),
                      value: orderhead,
                    );
                  }).toList(),
                  hint: LocaleText("orasd"),
                ),
              )
            : null);
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
        "choosemachine",
        textAlign: TextAlign.start,
        style: Manger().styleofText(kprimarycolor, false, 20, context, false),
      ),
    );
  }

  SingleChildScrollView orders(int type, Size size) {
    List<int> i = [1, 2, 3];
    return SingleChildScrollView(
        child: Column(children: [
      if (type == 1)
        for (int j = 0; j < i.length; j++)
          viewfreezcontant(
              size, "2/" + "${j + 8}" + "/2022", 15 + j * 3, j + 1),
      Padding(padding: EdgeInsets.all(10))
    ]));
  }

  Column viewfreezcontant(
      Size size, String dateTime, int freezasize, int myid) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    title: LocaleText(
                      "detailes",
                      style: Manger().styleofText(
                          Theme.of(context).colorScheme.secondary,
                          false,
                          18,
                          context,
                          false),
                      textAlign: TextAlign.center,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: LocaleText(
                            "reqno",
                            style: Manger().styleofText(
                                kprimarycolor, false, 16, context, false),
                            textAlign: TextAlign.start,
                          ),
                          trailing: Text("$myid"),
                        ),
                        ListTile(
                          title: LocaleText(
                            "reqdate",
                            style: Manger().styleofText(
                                kprimarycolor, false, 16, context, false),
                            textAlign: TextAlign.start,
                          ),
                          trailing: Text(dateTime),
                        ),
                        ListTile(
                          title: LocaleText(
                            "freezsize",
                            style: Manger().styleofText(
                                kprimarycolor, false, 16, context, false),
                            textAlign: TextAlign.start,
                          ),
                          trailing: Text("$freezasize"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10)),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kprimarycolor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0))),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: kprimarycolor,
                                    duration: Duration(seconds: 2),
                                    content: Text(Locales.lang == "en"
                                        ? "complaint has been sent successfully 👍"
                                        : "تم إرسال الشكوى بنجاح 👍"),
                                  ));
                                },
                                child: Text(
                                  "Make a complaint",
                                  style: TextStyle(color: kbackground),
                                )),
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
          child: Container(
            width: size.width * .95,
            decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: kprimarycolor),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  //margin: EdgeInsets.all(10),
                  child: ListTile(
                      title: LocaleText(
                        "reqdate",
                        textAlign: TextAlign.start,
                      ),
                      trailing: Text(
                        dateTime,
                        textAlign: TextAlign.end,
                      )),
                ),
                Container(
                  child: ListTile(
                      title: LocaleText(
                        "freezsize",
                        textAlign: TextAlign.start,
                      ),
                      trailing: Text(
                        "$freezasize",
                        textAlign: TextAlign.end,
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
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
