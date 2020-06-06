import 'package:flutter/material.dart';
import 'card_widget.dart';

class WorldwideCasesSection extends StatelessWidget {
  const WorldwideCasesSection({
    Key key,
    @required this.newCases,
    @required this.totalCases,
    @required this.totalDeaths,
    @required this.totalRecovered,
  }) : super(key: key);

  final int newCases;
  final int totalCases;
  final int totalDeaths;
  final int totalRecovered;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CardWidgets(
                text: 'New Cases', numberOfCases: newCases, icon: Icons.add),
            CardWidgets(
                text: 'Total Cases',
                numberOfCases: totalCases,
                icon: Icons.insert_chart),
          ],
        ),
        Row(
          children: <Widget>[
            CardWidgets(
                text: 'Total Deaths',
                numberOfCases: totalDeaths,
                icon: Icons.warning),
            CardWidgets(
                text: 'Total Recovered',
                numberOfCases: totalRecovered,
                icon: Icons.grade),
          ],
        ),
      ],
    ));
  }
}
