import 'dart:io';
import 'package:covidtracker/constants.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'App Info',
          style: TextStyle(
            fontFamily: 'Patua One',
            fontSize: 27,
          ),
        )),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: <Widget>[
          AboutDialog(
            applicationName: 'Covid Tracker',
            applicationIcon: Image.asset(
              'images/AppIcon.png',
              height: 90,
            ),
            applicationVersion: Platform.version,
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              launch(
                  'https://dribbble.com/shots/11015463-Covid-19-App-Free/attachments/2609400?mode=media');
            },
            child: Card(
              color: kPrimaryColor,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Design inspired from Dribbble.com',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
