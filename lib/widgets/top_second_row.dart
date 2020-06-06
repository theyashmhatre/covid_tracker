import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';

class TopSecondRow extends StatelessWidget {
  TopSecondRow({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: kSecondaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w600,
          fontFamily: 'Patua One'),
    );
  }
}
