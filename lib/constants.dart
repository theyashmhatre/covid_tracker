import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF473F97);
const Color kInactiveColor = Color(0xFFC0BDDB);
const Color kOrangeColor = Color(0xFFFF4C58);
Color kSecondaryColor = Colors.white;
const Color kLinearGrad1 = Color(0xFFAD1DEB);
const Color kLinearGrad2 = Color(0xFF6E78FC);

const Color kInfectedCard = Color(0xFF4CB5FF);

final day = DateTime.now().day;
final month = DateTime.now().month;
final year = DateTime.now().year;
final hours = DateTime.now().hour;
final minutes = DateTime.now().minute;
final seconds = DateTime.now().second;
final timeZone = DateTime.now().timeZoneName;
final x = DateTime.now();

TextStyle kPreventionTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.bold,
);
