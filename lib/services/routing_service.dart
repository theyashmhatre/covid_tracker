import 'package:covidtracker/constants.dart';
import 'package:covidtracker/screens/home_screen.dart';
import 'package:covidtracker/screens/info_screen.dart';
import 'package:covidtracker/screens/statistics_screen.dart';
import 'package:covidtracker/screens/all_country_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class RoutingService extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoutingServiceState();
}

class _RoutingServiceState extends State<RoutingService> {
  final _myPages = [
    HomeScreen(),
    StatisticsScreen(),
    AllCountryListScreen(),
    InfoScreen(),
  ];

  int _selectedPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _myPages,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedPage,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: kSecondaryColor),
          Icon(Icons.insert_chart, size: 30, color: kSecondaryColor),
          Icon(Icons.format_list_bulleted, size: 30, color: kSecondaryColor),
          Icon(Icons.info, size: 30, color: kSecondaryColor),
        ],
        color: kPrimaryColor,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: kSecondaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedPage = index;
            print(_selectedPage.toDouble());
            _pageController.animateToPage(_selectedPage,
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          });
        },
      ),
    );
  }
}
