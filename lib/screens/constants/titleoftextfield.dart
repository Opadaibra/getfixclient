import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:getfix/screens/constants/constant.dart';

class Titleoftextfield extends StatelessWidget {
  const Titleoftextfield({
    Key? key,
    required this.context,
    required this.title,
  }) : super(key: key);

  final BuildContext context;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Transform.translate(
      offset: Offset(0, 20),
      child: LocaleText(
        title,
        style: Manger().styleofText(kprimarycolor, false, 18, context, true),
        // textAlign: TextAlign.center,
      ),
    ));
  }
}
