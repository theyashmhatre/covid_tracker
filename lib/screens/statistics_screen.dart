import 'dart:convert';
import 'package:covidtracker/constants.dart';
import 'package:covidtracker/widgets/first_half_statistics.dart';
import 'package:covidtracker/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class StatisticsScreen extends StatefulWidget {
  StatisticsScreen({this.countriesData});
  final countriesData;

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List countriesData;
  fetchCountryData() async {
    print('fetchCountryData was called');
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      countriesData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return countriesData == null
        ? LoadingWidget()
        : Container(
            color: kPrimaryColor,
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 12 / 15,
                  child: Container(
                    color: kPrimaryColor,
                    padding: EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 30),
                    child: FirstHalfStatistics(countryData: countriesData),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: kSecondaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Prevention'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Patua One',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'images/avoidclose.png',
                                  height: 100,
                                ),
                                Text(
                                  'Avoid Close',
                                  style: kPreventionTextStyle,
                                ),
                                Text(' Contact', style: kPreventionTextStyle),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'images/washHands.jpg',
                                  height: 100,
                                ),
                                Text(
                                  'Clean your hands',
                                  style: kPreventionTextStyle,
                                ),
                                Text(
                                  'often',
                                  style: kPreventionTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'images/faceMask.png',
                                  height: 100,
                                ),
                                Text(
                                  'Wear a',
                                  style: kPreventionTextStyle,
                                ),
                                Text('facemask', style: kPreventionTextStyle),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
