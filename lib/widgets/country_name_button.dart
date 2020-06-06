import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';

class CountryNameButtonHome extends StatelessWidget {
  const CountryNameButtonHome({
    @required this.image,
    @required this.countryName,
  });

  final String countryName;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: kSecondaryColor,
      textColor: Colors.black,
      onPressed: () {},
      child: Row(
        children: <Widget>[
          image,
          SizedBox(width: 10),
          Text(
            countryName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
