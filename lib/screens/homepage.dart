import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({this.locationWeather, this.daysWeather});

  final locationWeather;
  final daysWeather;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text(locationWeather['main']['temp'].toString()),
      ),
    );
  }
}
