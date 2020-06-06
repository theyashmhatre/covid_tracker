import 'package:covidtracker/constants.dart';
import 'package:covidtracker/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllCountryListScreen extends StatefulWidget {
  @override
  _AllCountryListScreenState createState() => _AllCountryListScreenState();
}

class _AllCountryListScreenState extends State<AllCountryListScreen> {
  List countryData;

  fetchCountryData() async {
    print('fetchCountryData was called');
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Country Stats',
          style: TextStyle(fontFamily: 'Patua One', fontSize: 27),
        )),
        backgroundColor: kPrimaryColor,
      ),
      body: countryData == null
          ? Center(
              child: LoadingWidget(),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    height: 90,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                countryData[index]['countryInfo']['flag'],
                                height: 20,
                                width: 30,
                              ),
                              SizedBox(width: 20),
                              Text(
                                countryData[index]['country']
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Lora',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'CONFIRMED: ' +
                                        countryData[index]['cases'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                    'ACTIVE: ' +
                                        countryData[index]['active'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'RECOVERED: ' +
                                        countryData[index]['recovered']
                                            .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                  Text(
                                    'DEATHS: ' +
                                        countryData[index]['deaths'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.grey[100]
                                            : Colors.grey[900]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
