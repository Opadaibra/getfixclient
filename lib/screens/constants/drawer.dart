import 'package:getfix/screens/LogIn/LoginPage.dart';
import 'package:getfix/screens/Maintenanceid/Maintenanceid.dart';
import 'package:getfix/screens/Usertutorialguide/Usertutorialguide.dart';
import 'package:getfix/screens/addsite/Addsite.dart';
import 'package:getfix/screens/maintnancerequest/maintnancerequest.dart';
import 'package:getfix/screens/rate/ratemaintenance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/Settings/Settings.dart';
import 'package:getfix/screens/checkwarrantystate/warranty.dart';
import 'package:getfix/screens/constants/constant.dart';
import 'package:getfix/screens/notificaton/notification.dart';
import 'package:getfix/screens/Clientdashboard/Clientdashboard.dart';

class Workerdrawer extends StatefulWidget {
  const Workerdrawer({
    Key? key,
    required this.size,
    required this.primary,
    required this.secondary,
    required this.backgroundcolor,
  }) : super(key: key);
  final Size size;
  final Color primary;
  final Color secondary;
  final Color backgroundcolor;
  @override
  WorkerdrawerState createState() => WorkerdrawerState();
}

class WorkerdrawerState extends State<Workerdrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size.width * 0.80,
        child: ClipRRect(
          borderRadius: Locales.lang == "ar"
              ? BorderRadiusDirectional.only(
                      topEnd: Radius.circular(30),
                      bottomEnd: Radius.circular(30))
                  .resolve(TextDirection.rtl)
              : BorderRadiusDirectional.only(
                      topEnd: Radius.circular(30),
                      bottomEnd: Radius.circular(30))
                  .resolve(TextDirection.ltr),
          child: Drawer(
            //  elevation: 40,
            child: Container(
              color: kprimarycolor,
              child: Column(
                children: [
                  //DrawerHeader(child: Text("")),
                  useraccountheader(context),
                  //  maintnancerequest(context),
                  // notiticationListtitle(context),
                  //   rateteam(context),
                  showmissions(context),
                  // checkWarrantyestate(context),
                  //addsite(context),
                  maintenanceid(context),
                  usertutorialgid(context),
                  settings(context),
                  logout(context),
                ],
              ),
            ),
          ),
        ));
  }

  // ListTile notiticationListtitle(BuildContext context) {
  //   return ListTile(
  //       title: LocaleText(
  //         "notifi",
  //         textAlign: TextAlign.start,
  //         style: Manger().styleofText(widget.backgroundcolor, false,
  //             widget.size.width * 0.04, context, true),
  //       ),
  //       leading: Icon(
  //         Icons.notifications,
  //         color: widget.backgroundcolor,
  //       ),
  //       onTap: () {
  //         Navigator.push(
  //             context,
  //             new MaterialPageRoute(
  //                 builder: (context) => new MyyNotification()));
  //       });
  // }

  ListTile showmissions(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "showtasks",
        textAlign: TextAlign.start,
        style: Manger().styleofText(widget.backgroundcolor, false,
            widget.size.width * 0.04, context, true),
      ),
      leading: Icon(
        Icons.home,
        color: widget.backgroundcolor,
      ),
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Clientdashboard()));
      },
    );
  }

  ListTile checkWarrantyestate(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "warranty",
        textAlign: TextAlign.start,
        style: Manger().styleofText(widget.backgroundcolor, false,
            widget.size.width * 0.04, context, true),
      ),
      leading: Icon(
        Icons.qr_code,
        color: widget.backgroundcolor,
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new warranty()));
      },
    );
  }

  ListTile maintnancerequest(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "maintenancereq",
        textAlign: TextAlign.start,
        style: Manger().styleofText(widget.backgroundcolor, false,
            widget.size.width * 0.04, context, true),
      ),
      leading: Icon(
        Icons.precision_manufacturing_rounded,
        color: widget.backgroundcolor,
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new Maintnancerequest()));
      },
    );
  }

  ListTile addsite(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "addsite",
        textAlign: TextAlign.start,
        style: Manger().styleofText(widget.backgroundcolor, false,
            widget.size.width * 0.04, context, true),
      ),
      leading: Icon(
        Icons.location_on,
        color: widget.backgroundcolor,
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new Addsite()));
      },
    );
  }

  ListTile usertutorialgid(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "usertut",
        textAlign: TextAlign.start,
        style: Manger().styleofText(widget.backgroundcolor, false,
            widget.size.width * 0.04, context, true),
      ),
      leading: Icon(
        Icons.help_center_rounded,
        color: widget.backgroundcolor,
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new Usertutorialguide()));
      },
    );
  }

  ListTile maintenanceid(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "maintenanceid",
        textAlign: TextAlign.start,
        style: Manger().styleofText(widget.backgroundcolor, false,
            widget.size.width * 0.04, context, true),
      ),
      leading: Icon(
        Icons.format_list_numbered_outlined,
        color: widget.backgroundcolor,
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new Maintenanceid()));
      },
    );
  }

  ListTile rateteam(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "rate",
        textAlign: TextAlign.start,
        style: Manger().styleofText(widget.backgroundcolor, false,
            widget.size.width * 0.04, context, true),
      ),
      leading: Icon(
        Icons.star_rate_rounded,
        color: widget.backgroundcolor,
      ),
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Ratemaintenance()));
      },
    );
  }

  ListTile settings(BuildContext context) {
    return ListTile(
        title: LocaleText(
          "settings",
          textAlign: TextAlign.start,
          style: Manger().styleofText(widget.backgroundcolor, false,
              widget.size.width * 0.04, context, true),
        ),
        leading: Icon(
          Icons.settings,
          color: widget.backgroundcolor,
        ),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new Settings()));
        });
  }

  ListTile logout(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "logout",
        textAlign: TextAlign.start,
        style: Manger().styleofText(widget.backgroundcolor, false,
            widget.size.width * 0.04, context, true),
      ),
      leading: Icon(
        Icons.logout_rounded,
        color: widget.backgroundcolor,
      ),
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,
        );
      },
    );
  }

  UserAccountsDrawerHeader useraccountheader(BuildContext context) {
    return UserAccountsDrawerHeader(
      //currentAccountPictureSize: size * 0.18,
      currentAccountPicture: CircleAvatar(
        backgroundColor: ksecondrycolor,
      ),
      accountName: Text(
        "OpadaIbra",
        textAlign: TextAlign.start,
        style: Manger().styleofText(
            ksecondrycolor, false, widget.size.width * 0.05, context, false),
      ),
      accountEmail: Text(
        "Opadaibra@gmail.com",
        textAlign: TextAlign.left,
        style: Manger().styleofText(
            widget.secondary, false, widget.size.width * 0.04, context, false),
      ),
    );
  }
}
