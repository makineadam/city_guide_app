import 'dart:math';

import 'package:city_guide_app/controller/weatherservice/networking.dart';
import 'package:city_guide_app/view/splashscreen.dart';

class Attraction {
  String district;
  String title;
  String category;
  String imageurl;
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
        imageurl = relatedImage(category);
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
    return 'assets/images/heykel.png';
  } else if (category == 'plajlar') {
    return 'assets/images/plaj.png';
  } else if (category == 'operavebale') {
    return 'assets/images/operaandballet.webp';
  } else if (category == 'muzeler') {
    return 'assets/images/museum.webp';
  } else {
    return '';
  }
}

Future<dynamic> getCityAttraction(String attraction) async {
  NetworkHelper networkHelper =
      NetworkHelper('https://openapi.izmir.bel.tr/api/ibb/cbs/$attraction');

  var attractionData = await networkHelper.getData();
  return attractionData;
}
