import 'dart:async';
import 'package:covidtracker/screens/intro_screen.dart';
import 'package:covidtracker/services/routing_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:covidtracker/widgets/loading_widget.dart';

class StartupService extends StatefulWidget {
  @override
  _StartupServiceState createState() => _StartupServiceState();
}

class _StartupServiceState extends State<StartupService> {
  Future displayIntroScreen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool _seen = (preferences.getBool("seen") ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RoutingService()));
      print('if : $_seen');
    } else {
      await preferences.setBool("seen", true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => IntroScreen()));
      print('else : $_seen');
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      displayIntroScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoadingWidget(),
      color: Colors.white,
    );
  }
}
