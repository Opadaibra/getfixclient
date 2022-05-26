import 'package:getfix/screens/addsite/Addsitebody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/LogIn//LoginPage.dart';
import 'package:flutter/services.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ar']);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmysite();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    ThemeData lighttheme = ThemeData(
      shadowColor: Colors.grey[200],
      primaryColor: kprimarycolor,
      backgroundColor: Colors.white,
      dividerColor: Colors.white54, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(secondary: Color(0xffFF715A)),
    );
    ThemeData darktheme = ThemeData(
      primaryColor: Color(0xFF053F5E),
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black12, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Color(0xff4B89F1)),
    );
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        debugShowCheckedModeBanner: false,
        title: 'Client',
        theme: lighttheme,
        home: LoginPage(),
      ),
    );
  }

  getmysite() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    mysite = pref.getStringList("key")!;
    if (mysite != null) {
      sitecount = mysite.length;
    } else
      sitecount = 0;
    print(sitecount);
  }
}
