import 'dart:math';

import 'package:city_guide_app/controller/weatherservice/networking.dart';
import 'package:city_guide_app/variables.dart';
import 'package:city_guide_app/view/splashscreen.dart';
import 'package:flutter/material.dart';

class Attraction {
  String district;
  String title;
  String category;
  String imageurl;
  Color color;
  double distance;
  double lat;
  double lon;

  //Now let's create the constructor
  Attraction({
    required this.district,
    required this.title,
    required this.category,
    required this.lat,
    required this.lon,
  })  : distance = calculateDistance(latuser, lonuser, lat, lon),
        imageurl = relatedImage(category),
        color = findColor(category);
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

// Returns appropriate image.
String relatedImage(String category) {
  if (category == 'kuleanitveheykeller') {
    return 'assets/images/monument.jpg.png';
  } else if (category == 'plajlar') {
    return 'assets/images/plaj.png';
  } else if (category == 'operavebale') {
    return 'assets/images/operaandballet.webp';
  } else if (category == 'muzeler') {
    return 'assets/images/museum.webp';
  } else if (category == 'tarihiyapilar') {
    return 'assets/images/historicalbuildings.png';
  } else if (category == 'galerivesalonlar') {
    return 'assets/images/artgallery.png';
  } else if (category == 'goller') {
    return 'assets/images/goller.png';
  } else {
    return '';
  }
}

Color findColor(String category) {
  if (category == 'kuleanitveheykeller') {
    return Colors.lightBlue;
  } else if (category == 'plajlar') {
    return Color.fromARGB(255, 245, 213, 166);
  } else if (category == 'operavebale') {
    return Color.fromARGB(255, 247, 218, 248);
  } else if (category == 'muzeler') {
    return Colors.grey.shade300;
  } else if (category == 'tarihiyapilar') {
    return Color.fromARGB(255, 245, 244, 190);
  } else if (category == 'galerivesalonlar') {
    return Color.fromARGB(255, 250, 183, 205);
  } else if (category == 'goller') {
    return Color.fromARGB(255, 21, 106, 175);
  } else {
    return Colors.white;
  }
}

Future<dynamic> getCityAttraction(String attraction) async {
  NetworkHelper networkHelper =
      NetworkHelper('https://openapi.izmir.bel.tr/api/ibb/cbs/$attraction');

  var attractionData = await networkHelper.getData();
  return attractionData;
}
