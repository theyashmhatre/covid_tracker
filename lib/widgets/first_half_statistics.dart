import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/widgets/top_second_row.dart';
import 'circular_icon_widget.dart';
import 'statistics_row_card.dart';

class FirstHalfStatistics extends StatefulWidget {
  final List countryData;
  FirstHalfStatistics({this.countryData});

  @override
  _FirstHalfStatisticsState createState() => _FirstHalfStatisticsState();
}

class Country {
  String flag;
  String countryName;
  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;
  int activeCases;
  int seriousCases;

  Country(
      {this.flag,
      this.countryName,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered,
      this.activeCases,
      this.seriousCases});
}

class _FirstHalfStatisticsState extends State<FirstHalfStatistics> {
  List getCountries() {
    List<Country> countries = [];

    for (var i in widget.countryData) {
      setState(() {
        Country country = Country(
          countryName: i["country"],
          totalConfirmed: i["cases"],
          totalRecovered: i["recovered"],
          totalDeaths: i["deaths"],
          activeCases: i["active"],
          seriousCases: i["critical"],
        );

        countries.add(country);
      });
    }

    return countries;
  }

  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;
  int selectedCases;
  int selectedRecovered;
  int selectedDeaths;
  int selectedActiveCases;
  int selectedSeriousCases;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(getCountries());
    super.initState();
  }

  List<DropdownMenuItem<Country>> buildDropdownMenuItems(country) {
    List<DropdownMenuItem<Country>> items = List();
    for (Country country in getCountries()) {
      items.add(
        DropdownMenuItem(
          value: country,
          child: Text(country.countryName),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TopIconRow(),
        SizedBox(height: 20),
        Center(child: TopSecondRow(text: 'Statistics'.toUpperCase())),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: kPrimaryColor,
            ),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Expanded(
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  value: _selectedCountry,
                  items: _dropdownMenuItems,
                  onChanged: (Country selectedCountry) {
                    setState(() {
                      _selectedCountry = selectedCountry;
                      selectedCases = selectedCountry.totalConfirmed;
                      selectedRecovered = selectedCountry.totalRecovered;
                      selectedDeaths = selectedCountry.totalDeaths;
                      selectedActiveCases = selectedCountry.activeCases;
                      selectedSeriousCases = selectedCountry.seriousCases;
                      print(_selectedCountry.countryName);
                      print('confirmed cases: $selectedCases');
                    });
                  },
                  iconEnabledColor: kPrimaryColor,
                  hint: Text('Select Country'),
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        RowCards(
          selectedCases: selectedCases,
          selectedRecovered: selectedRecovered,
          selectedDeaths: selectedDeaths,
          selectedActiveCases: selectedActiveCases,
          selectedSeriousCases: selectedSeriousCases,
        ),
      ],
    );
  }
}
