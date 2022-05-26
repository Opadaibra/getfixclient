//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/Mywidgits/modifedappbar.dart';
import 'package:getfix/screens/constants/constant.dart';

class warrantystatebody extends StatefulWidget {
  @override
  _warrantystatebodyState createState() => _warrantystatebodyState();
}

class _warrantystatebodyState extends State<warrantystatebody> {
  List checkmethod = [false, false, false];

  String qrcodr = "";
  var _selectedphonnumber;
  var phonnumber = ["0999999999", "0962934928"];

  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            modiefedappbar(
                size: size,
                widgiticon: Icon(
                  Icons.qr_code,
                  size: size.width * 0.12,
                  color: kbackground,
                ),
                localeText: LocaleText(
                  "checws",
                  style: TextStyle(
                      color: kbackground,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05),
                )),
            //  padding2(size, 0.05),
            //  header(context, size),
            Manger().sizedBox(0, 0.05, context),
            entity(size, context),
            Manger().sizedBox(0, 0.01, context),
            Text(qrcodr),
            sendbutton(size, context),
          ],
        ),
      ),
    );
  }

  Row header(BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(start: 10, top: 10),
          child: LocaleText("checws",
              textAlign: TextAlign.right,
              style: Manger().styleofText(
                kprimarycolor,
                false,
                size.width * 0.05,
                context,
                false,
              )),
        )
      ],
    );
  }

  Container entity(Size size, BuildContext context) {
    return Container(
        // width: size.width * 0.9,
        child: Column(
      children: [
        emailbutton(size, context),
        SizedBox(height: size.height * 0.05),
        numberbutton(size, context),
        SizedBox(height: size.height * 0.05),
        barcodebutton(size, context),
        barcodeicon(context),
        Container(
          width: size.width * 0.75,
          child: checkmethod[1]
              ? DropdownButton(
                  isExpanded: true,
                  value: _selectedphonnumber,
                  onChanged: (newvalue) async {
                    setState(() {
                      _selectedphonnumber = newvalue;
                    });
                  },
                  items: phonnumber.map((orderhead) {
                    return DropdownMenuItem(
                      child: new Text(orderhead),
                      value: orderhead,
                    );
                  }).toList(),
                  hint: LocaleText("number"),
                )
              : null,
        ),
        divider(size)
      ],
    ));
  }

  Container barcodeicon(BuildContext context) {
    return Container(
        child: checkmethod[2]
            ? ListTile(
                leading: Container(
                    //alignment: AlignmentDirectional.bottomStart,
                    //alignment: Alignment.center,
                    child: IconButton(
                        onPressed: () async {
                          String scanning;
                          //= await FlutterBarcodeScanner();
                          setState(() {
                            //     qrcodr = scanning;
                            print(qrcodr);
                          });
                        },
                        icon: Icon(
                          Icons.camera_enhance_rounded,
                          color: Colors.grey,
                        ))),
                title: Container(
                  // alignment: Alignment.center,
                  // alignment: AlignmentDirectional.bottomCenter,
                  child: LocaleText(
                    'barcph',
                    style: Manger()
                        .styleofText(Colors.grey, false, 16, context, false),
                    // prefixIcon: Icon(Icons.camera_enhance_rounded)),
                  ),
                ))
            : null);
  }

  Future<void> scanqrcode() async {
    try {
      // ignore: unused_local_variable
      final qrcode = await FlutterBarcodeScanner.scanBarcode(
          '#053F5E', 'Cancel', true, ScanMode.QR);

      if (!mounted) {
        return;
      }
      setState(() {
        this.qrcodr = qrcodr;
        print(qrcode);
      });
    } on PlatformException {
      qrcodr = "Failed to catch Qr code";
    }
  }

  Container barcodebutton(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.1,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: kprimarycolor,
                  width: 1,
                ),
              ),
            ),
          ),
          child: LocaleText(
            "barcodebut",
            style: Manger().styleofText(
                kprimarycolor, false, size.width * 0.04, context, true),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            setState(() {
              checkmethod = [false, false, !checkmethod[2]];
            });
          }),
    );
  }

  Container numberbutton(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.1,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: kprimarycolor,
                  width: 1,
                ),
              ),
            ),
          ),
          child: LocaleText(
            "number",
            style: Manger().styleofText(
                kprimarycolor, false, size.width * 0.04, context, true),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            setState(() {
              checkmethod = [false, !checkmethod[1], false];
            });
          }),
    );
  }

  Container confirmationbutton(Size size, BuildContext context) {
    return Container(
        width: size.width * 0.3,
        height: size.height * 0.05,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: kprimarycolor,
                  width: 1,
                ),
              ),
            ),
          ),
          onPressed: () {
            //send email method
          },
          child: Text(
            Locales.lang == "ar" ? "تأكيد" : "confirm",
            style:
                Manger().styleofText(kprimarycolor, false, 14, context, false),
          ),
        ));
  }

  Container canselbutton(Size size, BuildContext context) {
    return Container(
        width: size.width * 0.3,
        height: size.height * .05,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: kprimarycolor,
                  width: 1,
                ),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            Locales.lang == "ar" ? "رفض" : "Cancel",
            style:
                Manger().styleofText(kprimarycolor, false, 14, context, false),
          ),
        ));
  }

  Container emailbutton(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.1,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: kprimarycolor,
                  width: 1,
                ),
              ),
            ),
          ),
          child: LocaleText(
            "email",
            style: Manger().styleofText(
                kprimarycolor, false, size.width * 0.04, context, true),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      scrollable: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      title: LocaleText("alert",
                          style: Manger().styleofText(
                              kprimarycolor, false, 18, context, false),
                          textAlign: TextAlign.center),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            confirmationbutton(size, context),
                            SizedBox(width: size.width * 0.02),
                            canselbutton(size, context),
                          ],
                        )
                      ],
                      content: Column(
                        children: [
                          LocaleText(
                            "emailalert",
                            style: Manger().styleofText(
                                kprimarycolor, false, 14, context, false),
                          ),
                          Text(
                            "opadaibra@gmail.com",
                            style: Manger().styleofText(
                                ksecondrycolor, false, 14, context, false),
                          )
                        ],
                      ));
                });
            setState(() {
              checkmethod = [!checkmethod[0], false, false];
            });
          }),
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
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: kprimarycolor,
                  duration: Duration(seconds: 2),
                  content:
                      // Text(
                      //     Locales.lang == "en"
                      //         ? "⚠ Sorry, missing barcode photo "
                      //         : "عذراً! لم يتم إرفاق صورة عن الباركود  ⚠",
                      //     textAlign: TextAlign.center,
                      //   )
                      // :
                      Text(Locales.lang == "en" ? "Done 👍" : "تم الإرسال 👍"),
                ));
              });
            },
          ),
        )
      ],
    );
  }

  Container divider(Size size) {
    return Container(
      width: size.width * 0.9,
      child: checkmethod[2]
          ? Divider(
              color: Colors.grey[600],
              height: 0,
              thickness: 0.7,
            )
          : null,
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
