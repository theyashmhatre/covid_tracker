import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';

class CardWidgets extends StatelessWidget {
  CardWidgets(
      {@required this.text, @required this.numberOfCases, @required this.icon});
  final String text;
  final IconData icon;
  final int numberOfCases;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: InkWell(
          splashColor: Colors.white.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(icon),
                    backgroundColor: kPrimaryColor,
                  ),
                  SizedBox(height: 25),
                  Center(
                      child: Text(
                    numberOfCases.toString(),
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: 'Lora',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  SizedBox(height: 10),
                  Center(
                      child: Text(
                    text,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidgetsStatistics extends StatelessWidget {
  CardWidgetsStatistics(
      {@required this.text,
      @required this.numberOfCases,
      @required this.color});
  final String text;
  final String numberOfCases;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        color: color,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    color: kSecondaryColor,
                    fontFamily: 'Lora',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 35),
              Text(
                numberOfCases,
                style: TextStyle(
                  color: kSecondaryColor,
                  fontFamily: 'Lora',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
            ],
          ),
        ),
      ),
    );
  }
}
