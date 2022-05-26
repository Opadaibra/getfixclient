//Sign BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';

//import 'package:fluttertoast/fluttertoast.dart';
List<String> nmysite = ["aa", "ab"];
int sitecount = 0;

class MaintnancerequestBody extends StatefulWidget {
  @override
  _maintnancerequestState createState() => _maintnancerequestState();
}

class _maintnancerequestState extends State<MaintnancerequestBody> {
  // ignore: deprecated_member_use
  var _selectedsite;
  var arr = [false, false, false];
  final TextEditingController machinsize = new TextEditingController();
  final TextEditingController maintenanceday = new TextEditingController();
  final TextEditingController comenucationnum = new TextEditingController();
  final TextEditingController explainstate = new TextEditingController();
  final TextEditingController note = new TextEditingController();
  // final TextEditingController  maintenanceday= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    var divider = Divider(
      color: kprimarycolor,
      thickness: 2,
      height: 10,
    );
    return Column(children: [
      sitedrobdowbutton(size, context),
      padding2(size, 0.01),
      machin(context, size),
      Container(
          child: anybuttonpressed()
              ? ListTile(
                  title: LocaleText(
                  "fillreq",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kprimarycolor),
                  textAlign: TextAlign.center,
                ))
              : null),
      Expanded(child: body(size))
    ]);
  }

  Container sitedrobdowbutton(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.15,
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0, -2),
            child: Container(
              width: size.width,
              height: size.height * 0.15 - 27,
              decoration: BoxDecoration(
                  color: kprimarycolor,
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(kdefaultradius),
                      bottomStart: Radius.circular(kdefaultradius))),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 54,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              decoration: BoxDecoration(
                  color: kbackground,
                  borderRadius: BorderRadius.circular(kdefaultradius),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurStyle: BlurStyle.normal,
                        blurRadius: 30,
                        color: kprimarycolor.withOpacity(0.8))
                  ]),
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      isExpanded: true,
                      //  autofocus: false,
                      style: Manger().styleofText(
                          ksecondrycolor, false, 14, context, true),
                      value: _selectedsite,
                      onChanged: (newvalue) async {
                        setState(() {
                          _selectedsite = newvalue;
                        });
                      },
                      items: nmysite.map((site) {
                        return DropdownMenuItem(
                          child: new Text(
                            site,
                            style: TextStyle(wordSpacing: 5),
                          ),
                          value: site,
                        );
                      }).toList(),
                      hint: LocaleText(
                        "site",
                        style: Manger().styleofText(
                            kprimarycolor, false, 14, context, true),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  ListView body(Size size) {
    return ListView(
      children: [
        padding2(size, 0.01),
        // SizedBox(
        //   height: size.height * 0.3,
        //   width: size.width ,
        //   child: Stepper(
        //     steps: getstep(),
        //     controlsBuilder: (context, {onStepCancel, onStepContinue}) => null,
        //     type: StepperType.horizontal,
        //   ),
        // ),
/*
              Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Theme.of(context).colorScheme.secondary,
                child: Column(
                  children: [
                    Text(
                      "Request state",
                      style: Manger().styleofText(
                          kbackground, false, size.width * 0.05, context, true),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            whatisstate() == 1
                                ? Icons.send_rounded
                                : Icons.check_circle_outline_sharp,
                            size: size.width * 0.1,
                            color:
                                whatisstate() == 1 ? kbackground : kprimarycolor),
                        Text("--------------"),
                        Icon(
                          Icons.wifi_protected_setup,
                          size: size.width * 0.1,
                        ),
                        Text("----------------"),
                        Icon(
                          Icons.done,
                          size: size.width * 0.1,
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  ],
                ),
              ),
      */

        Container(child: anybuttonpressed() ? fillorders(1, size) : null),
      ],
    );
  }

  int whatisstate() {
    return 2;
  }

  List<Step> getstep() => [
        Step(
          title: Text("requestsend"),
          content: Container(),
        ),
        Step(title: Text("processing"), content: Container()),
        Step(title: Text("Done"), content: Container()),
      ];

  Container machin(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.1,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kprimarycolor.withOpacity(0.25),
      ),
      child: Row(
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
          Padding(padding: EdgeInsetsDirectional.only(start: kdefaultpadding)),
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
          Padding(padding: EdgeInsetsDirectional.only(start: kdefaultpadding)),
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
      ),
    );
  }

  Container headline(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 10, top: 10),
      child: LocaleText(
        "choosemainmachine",
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: ksecondrycolor),
        //style: Manger().styleofText(kprimarycolor, false, 20, context, false),
      ),
    );
  }

  Container fillorders(int type, Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kprimarycolor.withOpacity(0.25)),
      child: SingleChildScrollView(
          child: Column(children: [
        sizeofmachine(size),
        maintenancedate(size),
        phonenumber(size),
        explainissue(size),
        barcodephoto(size),
        dammagevedio(size),
        notes(size),
        voicerecorde(size),
        sendbuton(size, context),
      ])),
    );
  }

  Container voicerecorde(Size size) {
    return Container(
      padding: EdgeInsetsDirectional.all(10),
      child: Row(
        children: [
          LocaleText("record",
              style: Manger()
                  .styleofText(Colors.black, false, 14, context, false)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                size: size.width * 0.07,
                color: kerror,
              )),
        ],
      ),
    );
  }

  Container notes(Size size) {
    return Container(
      width: size.width * 0.9,
      // height: size.height * 0.06,
      child: TextField(
        controller: note,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
            hintText: Locales.lang == "en" ? "Notes " : "ملاحظات",
            hintStyle:
                Manger().styleofText(Colors.black, false, 14, context, false)),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.name,
      ),
    );
  }

  Column dammagevedio(Size size) {
    return Column(children: [
      ListTile(
        //    alignment: Alignment.center,
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_camera_back_rounded,
              color: Colors.grey,
            )),

        title:
            //width: size.width * 0.75,
            LocaleText(
          'vedio',
          style: Manger().styleofText(
              Colors.black, false, size.width * 0.04, context, false),
          // prefixIcon: Icon(Icons.camera_enhance_rounded)),
        ),
      ),
      Container(
        width: size.width * .9,
        child: Divider(
          height: 0,
          thickness: .5,
          color: Colors.grey[800],
        ),
      ),
    ]);
  }

  Column barcodephoto(Size size) {
    return Column(
      children: [
        ListTile(
          //    alignment: Alignment.center,
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_enhance_rounded,
                color: Colors.grey,
              )),

          title:
              //width: size.width * 0.75,
              LocaleText(
            'barcph',
            style: Manger().styleofText(
                Colors.black, false, size.width * 0.04, context, false),
            // prefixIcon: Icon(Icons.camera_enhance_rounded)),
          ),
        ),
        Container(
          width: size.width * .9,
          child: Divider(
            height: 0,
            thickness: .5,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Container explainissue(Size size) {
    return Container(
      width: size.width * 0.9,
      // height: size.height * 0.06,
      child: TextField(
        controller: explainstate,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
            hintText: Locales.lang == "en" ? "Explain Issue " : "شرح الحالة",
            hintStyle:
                Manger().styleofText(Colors.black, false, 14, context, false)),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.name,
      ),
    );
  }

  Container phonenumber(Size size) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.06,
      child: TextField(
        controller: comenucationnum,
        decoration: InputDecoration(
            hintText: Locales.lang == "en" ? "Phone number " : "رقم التواصل",
            hintStyle:
                Manger().styleofText(Colors.black, false, 14, context, false)),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.name,
      ),
    );
  }

  Container maintenancedate(Size size) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.06,
      child: TextField(
        controller: maintenanceday,
        decoration: InputDecoration(
            hintText: Locales.lang == "en"
                ? "Favorite maintenance day"
                : "يوم الصيانة الذي تفضله",
            hintStyle:
                Manger().styleofText(Colors.black, false, 14, context, false)),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.name,
      ),
    );
  }

  Container sizeofmachine(Size size) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.06,
      child: TextField(
        controller: machinsize,
        decoration: InputDecoration(
            hintText: Locales.lang == "en" ? "Size" : "القياس",
            hintStyle:
                Manger().styleofText(Colors.black, false, 14, context, false)),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.name,
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
  Row sendbuton(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //  alignment: Alignment.center,
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
                  content: Text(Locales.lang == "en"
                      ? "request has been sent successfully 👍"
                      : "تم إرسال الطلب بنجاح 👍"),
                ));
              });
            },
          ),
        )
      ],
    );
  }

  void sendrequest() async {
    //   final Response = await http.post(url)
  }
}
