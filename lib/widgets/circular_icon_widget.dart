import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';

class TopIconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircularIconWidget(icon: Icons.short_text),
        Spacer(),
        CircularIconWidget(icon: Icons.notifications_none),
      ],
    );
  }
}

class CircularIconWidget extends StatelessWidget {
  final IconData icon;
  CircularIconWidget({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kSecondaryColor,
      child: Icon(
        icon,
        color: kPrimaryColor,
        size: 30,
      ),
    );
  }
}
