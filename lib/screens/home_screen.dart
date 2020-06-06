import 'dart:ui';
import 'package:covidtracker/constants.dart';
import 'package:covidtracker/widgets/country_name_button.dart';
import 'package:covidtracker/widgets/home_screen_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/widgets/circular_icon_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:covidtracker/widgets/top_second_row.dart';
import 'package:covidtracker/services/networking.dart';
import 'package:covidtracker/widgets/worldwide_cases_section.dart';
import 'package:covidtracker/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.countryData});
  final countryData;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _launched;
  String _phone = '+91 00000000000';
  int newCases;
  int totalCases;
  int totalDeaths;
  int totalRecovered;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    print('home getData was called');
    NetworkHelper networkHelper =
        NetworkHelper('https://api.covid19api.com/summary');

    var covidData = await networkHelper.getData();

    setState(() {
      newCases = covidData['Global']['NewConfirmed'];
      totalCases = covidData['Global']['TotalConfirmed'];
      totalDeaths = covidData['Global']['TotalDeaths'];
      totalRecovered = covidData['Global']['TotalRecovered'];
      print('new cases $totalRecovered');
    });
  }

  _redirect(String url) async {
    print('makePhoneCall launched');
    if (await canLaunch(url)) {
      launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 10 / 9,
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        15.0, // Move to right 10  horizontally
                        10.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                padding:
                    EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TopIconRow(),
                    SizedBox(height: 25),
                    Row(
                      children: <Widget>[
                        TopSecondRow(text: 'Covid Tracker'),
                        Spacer(),
                        CountryNameButtonHome(
                            image: Image.asset(
                              'images/globe.png',
                              scale: 2,
                            ),
                            countryName: 'Global'),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Are you feeling sick?',
                      style: TextStyle(
                        fontSize: 20,
                        color: kSecondaryColor,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'If you feel sick with any of the Covid-19 symptoms'
                      ' please call or SMS us immediately for help.',
                      style: TextStyle(color: kInactiveColor),
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        HomeScreenButtons(
                            icon: Icons.call,
                            colour: kOrangeColor,
                            text: 'Call',
                            onPressed: () {
                              setState(() {
                                _launched = _redirect('tel:$_phone');
                              });
                            }),
                        HomeScreenButtons(
                          icon: Icons.chat,
                          colour: Colors.blue,
                          text: 'SMS',
                          onPressed: () {
                            _launched = _redirect('sms:$_phone');
                          },
                        ),
                      ],
                    )
                  ],
                )),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Covid-19 Latest Update',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 15),
            child: Row(
              children: <Widget>[
                Text(
                  'Last updated: $day-$month-$year $hours:$minutes:$seconds $timeZone',
                  style: TextStyle(
                    color: kInactiveColor,
                  ),
                ),
                Spacer(),
                Text(
                  'Details',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          newCases == null
              ? LoadingWidget()
              : WorldwideCasesSection(
                  newCases: newCases,
                  totalCases: totalCases,
                  totalDeaths: totalDeaths,
                  totalRecovered: totalRecovered),
        ],
      ),
    );
  }
}
