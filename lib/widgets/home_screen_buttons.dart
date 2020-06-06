import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';

class HomeScreenButtons extends StatelessWidget {
  HomeScreenButtons(
      {@required this.icon,
      @required this.colour,
      @required this.text,
      this.onPressed});

  final IconData icon;
  final Color colour;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 10,
      textColor: kSecondaryColor,
      color: colour,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: <Widget>[
              Icon(icon),
              SizedBox(width: 12),
              Text(
                text,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
