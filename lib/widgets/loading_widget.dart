import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covidtracker/constants.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
//                  alignment: Alignment.center,
      child: SpinKitDoubleBounce(
        color: kPrimaryColor,
        size: 80,
      ),
    );
  }
}
