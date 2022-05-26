import 'package:flutter/material.dart';
class Watermark extends StatelessWidget {
  const Watermark({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'Images/hafez.png',
        color: Colors.grey[200],
      ),
    );
  }
}