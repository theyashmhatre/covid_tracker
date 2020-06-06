import 'package:covidtracker/constants.dart';
import 'package:covidtracker/services/routing_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/intropage.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 30,
              right: 20,
              child: RaisedButton(
                  color: kPrimaryColor,
                  splashColor: Colors.black,
                  visualDensity: VisualDensity(vertical: 1),
                  highlightColor: Colors.black,
                  autofocus: true,
                  elevation: 20,
                  focusElevation: 10,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: kSecondaryColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                          backgroundColor: Colors.greenAccent,
                          child: Icon(Icons.keyboard_arrow_right,
                              color: kPrimaryColor)),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            curve: Curves.linear,
                            duration: Duration(seconds: 1),
                            child: RoutingService(),
                            type: PageTransitionType.rightToLeftWithFade));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
