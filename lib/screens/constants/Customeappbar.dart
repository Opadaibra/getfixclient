import 'package:getfix/screens/addsite/Addsitebody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';

double appbarheight = 0;
var _selectedsite;
int sitecount = 0;

class Customeappbar extends StatefulWidget implements PreferredSizeWidget {
  Customeappbar({Key? key})
      : preferredSize = Size.fromHeight(appbarheight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  State<Customeappbar> createState() => _CustomeappbarState();
}

class _CustomeappbarState extends State<Customeappbar> {
  List<String> currentlist = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    appbarheight = size.height * 0.25;
    return AppBar(
      elevation: size.width * 0.25,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      //leadingWidth: 0,

      toolbarHeight: size.width * 0.5,
      automaticallyImplyLeading: true,

      backgroundColor: kprimarycolor,
      //leadingWidth: 10,
      title: Transform.translate(
        offset: Locales.lang == 'ar'
            ? Offset(size.width * 0.02, 0)
            : Offset(-size.width * 0.07, 0),
        //  alignment: AlignmentDirectional.topStart,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text('Cranes'),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: size.width * 0.05),
                  child: Image.asset(
                    'Images/whiteGetFix.png',
                    width: size.width * 0.7,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Transform.translate(
                offset: Locales.lang == 'ar'
                    ? Offset(size.width * 0.05, 0)
                    : Offset(size.width * 0.02, 0),
                child: sitebutton(size, context))
            /*  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Locales.lang == 'ar'
                      ? Offset(-size.width * 0.04, 0)
                      : Offset(size.width * 0.05, 0),
                  child: Container(
                    margin: EdgeInsets.only(left: size.width * 0.05),
                    alignment: Alignment.center,
                    child: Text(
                      'Maintenance Team',
                      textAlign: TextAlign.center,
                      style: textmanger().styleofText(Colors.grey, false,
                          size.width * 0.04, context, false),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Locales.lang == 'ar'
                      ? Offset(size.width * 0.04, 0)
                      : Offset(size.width * 0.02, 0),
                  child: Container(
                      margin: EdgeInsets.only(left: size.width * 0.05),
                      alignment: Alignment.center,
                      child: Icon(Icons.group)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.05),
                  alignment: Alignment.center,
                  child: Text(
                    'Team ID: 88  ',
                    textAlign: TextAlign.center,
                    style: textmanger().styleofText(
                        Colors.grey, false, size.width * 0.04, context, false),
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }

  DropdownButton sitebutton(Size size, BuildContext context) {
    return DropdownButton(
      iconEnabledColor: Colors.amber,
      icon: Icon(Icons.arrow_drop_down_rounded),

      focusColor: kbackground,
      menuMaxHeight: size.height * 0.5,
      //itemHeight: size.height * 0.2,
      isExpanded: false,
      style: Manger().styleofText(
          Theme.of(context).colorScheme.secondary, false, 14, context, true),
      value: _selectedsite,
      onChanged: (newvalue) async {
        setState(() {
          _selectedsite = newvalue;
        });
      },
      items: mysite.map((site) {
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
        style: Manger().styleofText(kbackground, false, 14, context, true),
      ),
    );
  }
}
