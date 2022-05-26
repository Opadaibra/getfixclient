//LOGIN BODY

import 'package:getfix/Controller/linkapi.dart';
import 'package:getfix/screens/Clientdashboard/Clientdashboard.dart';
import 'package:getfix/screens/constants/Customeappbar.dart';
// import 'package:clientaap/screens/Clientdashboard/Clientdashboard.dart';
// import 'package:clientaap/screens/Clientdashboard/dashboardBody.dart';
// import 'package:clientaap/screens/constants/Customeappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
// import 'package:clientaap/screens/Checkcode/Check4DigitCode,.dart';
import 'package:getfix/Controller/Apicaller.dart';
import 'package:getfix/screens/Signup/SignUpPage.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:percent_indicator/percent_indicator.dart';

bool loginpressed = false;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Apicaller databaseHelper = new Apicaller();
  Text usernamehint = LocaleText("username");
  Text passwordhint = LocaleText("pasword");
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  Apicaller apicaller = new Apicaller();
  String msgStatus = '';
  /*_onPressed() {
    setState(() {
      /*if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        databaseHelper
            .logindata(_emailController.text.trim().toLowerCase(),
                _passwordController.text.trim())
            .whenComplete(() {
          if (databaseHelper.statues) {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new Check4DigitCode(),
              ),
            );
            _showDialog();
            msgStatus = 'Check email or password';
          } else {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new Check4DigitCode(),
              ),
            );
            
            print('clear');
          }
        });
        
      }
    });*/
      appbarheight = MediaQuery.of(context).size;
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new Clientdashboard(),
        ),
      );
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    return Container(
        //    alignment: Alignment.center,

        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          boxpadding(size, 0.03),
          topImage(size),
          middlebox(size),
          boxpadding(size, 0.02),
          creataccount(size)
        ],
      ),
    ));
  }

  SizedBox boxpadding(Size size, double padding) {
    return SizedBox(
      height: size.height * padding,
    );
  }

  Padding padding2(Size size, double decreasrate) =>
      Padding(padding: EdgeInsets.only(top: size.height * decreasrate));

  Container creataccount(Size size) {
    return Container(
      //  padding: EdgeInsets.all(size.width * 0.05),
      width: size.width * 0.5,
      // ignore: deprecated_member_use
      child: InkWell(
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kbackground),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            child: LocaleText(
              'creataccount',
              style:
                  Manger().styleofText(kprimarycolor, false, 12, context, true),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              });
            }),
      ),
    );
  }

  Container middlebox(Size size) {
    return middleboxoutline(size);
  }

  Container middleboxoutline(Size size) {
    return Container(
      width: size.width * 0.80,
      height: size.height * 0.60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              //    color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 15),
              color: Colors.black26
              // changes position of shadow
              ),
        ],
        color: kbackground,
        border: Border.all(
          width: 0.1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: middleboxentites(size),
    );
  }

  Column middleboxentites(Size size) {
    return Column(
      children: [
        padding2(size, 0.05),
        LocaleText(
          "sign",
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: kprimarycolor,
                fontWeight: FontWeight.bold,
              ),
        ),
        boxpadding(size, 0.03),
        signin(size),
        boxpadding(size, 0.02),
        password(size),
        boxpadding(size, 0.02),
        
        loginbutton(size),
        boxpadding(size, 0.02),
        Container(
          //height: size.height * 0.01,
          child: new Text(
            '$msgStatus',
            textAlign: TextAlign.center,

            //  overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, color: kerror),
          ),
        ),
        boxpadding(size, 0.02),
        forgotpassword(size),
        //singinthrow(),
        changesigninmethod(size)
        //singinthrow(),
        // Padding(padding: EdgeInsets.all(size.height * 0.01)),
        //changesigninmethod(size),
        //Padding(padding: EdgeInsets.all(size.height * 0.01)),
      ],
    );
  }

  Container singinthrow() {
    return Container(
      child: LocaleText(
        "singinthrow",
        textAlign: TextAlign.center,
      ),
    );
  }

  // ignore: deprecated_member_use
  FlatButton forgotpassword(Size size) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: null,
      child: LocaleText(
        "forgotpassword",
        style: Manger().styleofText(
            kprimarycolor, false, size.width * 0.04, context, true),
      ),
    );
  }

  Container changesigninmethod(Size size) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: null,
            child: Icon(
              Icons.email,
              size: size.width * 0.1,
              color: Colors.red[400],
            ),
          ),
          // ignore: deprecated_member_use
          FlatButton(
              onPressed: null,
              child: Icon(
                Icons.facebook,
                size: size.width * 0.1,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }

  Container loginbutton(Size size) {
    return Container(
      width: size.width * 0.65,
      height: size.height * 0.06,
      child: InkWell(
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ksecondrycolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            child: loginpressed
                ? CircularProgressIndicator(
                    color: kbackground,
                  )
                : LocaleText(
                    "sign",
                    style: Manger().styleofText(
                        kbackground, false, size.width * 0.04, context, true),
                  ),
            onPressed: () async {
              await login(size);
            }
            // {
            //   setState(() {
            //     appbarheight = size.height * 0.25;
            //     Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(builder: (context) => Clientdashboard()),
            //       (Route<dynamic> route) => false,
            //     );
            //   });
            // },
            ),
      ),
    );
  }

  bool checkfieldformat() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty)
      return false;
    return true;
  }

  test() async {
    if (checkfieldformat()) {
      var response = await apicaller.getrequest(Loginlink);
      print(response);
    } else {
      setState(() {
        msgStatus = Locales.string(context, "msgemptystate");
      });
    }
  }

  login(Size size) async {
    if (checkfieldformat()) {
      setState(() {
        loginpressed = true;
      });
      var response = await apicaller.postrequest(Loginlink, {
        "username": _emailController.text,
        "password": _passwordController.text,
      });

      try {
        if (response['message'] == "Success") {
          setState(() {
            loginpressed = false;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Clientdashboard()),
            (Route<dynamic> route) => false,
          );
          setState(() {
            appbarheight = size.height * 0.25;
          });
        } else if (response["message"] == 'Invalid') {
          setState(() {
            loginpressed = false;
          });
          msgStatus = "Wrong email or password";
        }
      } catch (e) {
        setState(() {
          loginpressed = false;
          msgStatus = "check your internet connection";
        });
      }
    } else {
      setState(() {
        msgStatus = Locales.string(context, "msgemptystate");
      });
    }
  }

  Container password(Size size) {
    return Container(
      width: size.width * 0.70,
      child: TextField(
        controller: _passwordController,
        textAlign: TextAlign.start,
        autocorrect: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[80],
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Theme.of(context).colorScheme.secondary,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                width: 2.0,
                color: kbackground,
                //style: BorderStyle.solid
              ),
              borderRadius: new BorderRadius.all(Radius.circular(120)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                width: 2.0,
                color: kbackground,
                //style: BorderStyle.solid
              ),
              borderRadius: new BorderRadius.all(Radius.circular(120)),
            ),
            hintText: Locales.string(context, "enterpass"),
            hintStyle: TextStyle(
                fontSize: 14.0, height: 2.0, color: Colors.grey[600])),
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }

  Container signin(Size size) {
    return Container(
      width: size.width * 0.70,
      //height: size.height * 0.06,
      child: TextField(
        // expands: true,

        controller: _emailController,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[80],
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            prefixIcon: Icon(Icons.person,
                color: Theme.of(context).colorScheme.secondary),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                width: 0,
                color: kbackground,
                //style: BorderStyle.solid
              ),
              borderRadius: new BorderRadius.all(Radius.circular(120)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                width: 0,
                color: kbackground,
                //style: BorderStyle.solid
              ),
              borderRadius: new BorderRadius.all(Radius.circular(120)),
            ),
            hintText: Locales.string(context, "enterusername"),
            hintStyle:
                TextStyle(fontSize: 14.0, height: 2.0, color: Colors.grey[600])

            // icon: Icon(Icons.person),
            ),
        keyboardType: TextInputType.name,
      ),
    );
  }

  Container topImage(Size size) {
    return Container(
      child: Image.asset(
        "Images/GetFix.png",
        width: size.width,
        height: size.height * 0.2,
        alignment: Alignment.center,
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your email or password'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new RaisedButton(
                child: new Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
