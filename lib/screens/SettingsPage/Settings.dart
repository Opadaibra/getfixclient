import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_restart/flutter_restart.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> _languages = ['English', 'العربية'];
  var _selectedlanguage;
  bool _darkmode = false;
  String localeText = "";
  @override
  void initState() {
    getlanguage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    Color primary = kprimarycolor;
    Color secondary = Theme.of(context).colorScheme.secondary;
    Color backgroundcolor = kbackground;

    return Scaffold(
        /*dashboardappbar().Appbarwigit(context),*/
        appBar: AppBar(
          elevation: size.width * 0.25,
          toolbarHeight: size.height * 0.1,
          backgroundColor: kprimarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
          title: LocaleText("settings"),
          centerTitle: true,
          //     centerTitle: true,
        ),
        body: Center(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(size.height * 0.01)),
              ListTile(
                title: LocaleText(
                  "lang",
                  style: TextStyle(
                      color: kprimarycolor, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.language,
                  color: primary,
                ),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    
                    hint: Text(localeText),
                    value: _selectedlanguage,
                    
                    onChanged: (newvalue) async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();

                      setState(() {
                        pref.setString("lang", newvalue.toString());
                        _selectedlanguage = newvalue;
                        print(_selectedlanguage);
                        if (_selectedlanguage == 'العربية')
                          LocaleNotifier.of(context)!.change("ar");
                        else
                          LocaleNotifier.of(context)!.change("en");
                        // FlutterRestart.restartApp();
                      });
                    },
                    items: _languages.map((lang) {
                      return DropdownMenuItem(
                        child: new Text(lang),
                        value: lang,
                      );
                    }).toList(),
                  ),
                ),
              ),
              Divider(
                color: primary,
                thickness: 2,
              ),
              ListTile(
                title: LocaleText(
                  'theme',
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.light_mode,
                  color: primary,
                ),
                trailing: Switch(
                  inactiveThumbColor: primary,
                  activeColor: secondary,
                  value: _darkmode,
                  focusColor: primary,
                  onChanged: (val) {
                    setState(() {
                      _darkmode = val;
                    });
                  },
                ),
              ),
              Divider(
                color: primary,
                thickness: 2,
              ),
            ],
          ),
        ));
  }

  getlanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      localeText = preferences.getString("lang")!;
    });
  }
}
