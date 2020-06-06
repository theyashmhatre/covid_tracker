import 'package:flutter/material.dart';
import 'card_widget.dart';

class RowCards extends StatelessWidget {
  const RowCards({
    Key key,
    @required this.selectedCases,
    @required this.selectedRecovered,
    @required this.selectedDeaths,
    this.selectedActiveCases,
    this.selectedSeriousCases,
  }) : super(key: key);

  final int selectedCases;
  final int selectedRecovered;
  final int selectedDeaths;
  final int selectedActiveCases;
  final int selectedSeriousCases;

  @override
  Widget build(BuildContext context) {
    return selectedDeaths == null
        ? Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CardWidgetsStatistics(
                      text: 'Infected',
                      numberOfCases: '...',
                      color: Color(0xFFFFB159).withOpacity(0.9)),
                  SizedBox(width: 8),
                  CardWidgetsStatistics(
                      text: 'Deaths',
                      numberOfCases: '...',
                      color: Color(0xFFFF5959)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  CardWidgetsStatistics(
                    text: 'Recovered',
                    numberOfCases: '...',
                    color: Color(0xFF4CD97B),
                  ),
                  CardWidgetsStatistics(
                      text: 'Active', numberOfCases: '...', color: Colors.blue),
                  CardWidgetsStatistics(
                      text: 'Serious',
                      numberOfCases: '...',
                      color: Colors.purple),
                ],
              ),
            ],
          )
        : Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CardWidgetsStatistics(
                      text: 'Infected',
                      numberOfCases: selectedCases.toString(),
                      color: Color(0xFFFFB259)),
                  CardWidgetsStatistics(
                      text: 'Deaths',
                      numberOfCases: selectedDeaths.toString(),
                      color: Color(0xFFFF5959)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  CardWidgetsStatistics(
                    text: 'Recovered',
                    numberOfCases: selectedRecovered.toString(),
                    color: Color(0xFF4CD97B),
                  ),
                  SizedBox(width: 8),
                  CardWidgetsStatistics(
                      text: 'Active',
                      numberOfCases: selectedActiveCases.toString(),
                      color: Colors.blue),
                  CardWidgetsStatistics(
                      text: 'Serious',
                      numberOfCases: selectedSeriousCases.toString(),
                      color: Colors.purple),
                ],
              ),
            ],
          );
  }
}
