import 'package:city_guide_app/controller/attractionservice/attraction_service.dart';
import 'package:city_guide_app/main.dart';
import 'package:city_guide_app/mainstructure.dart';
import 'package:city_guide_app/model/attractions_model.dart';
import 'package:flutter/material.dart';
import 'package:city_guide_app/controller/weatherservice/location.dart';
import 'package:city_guide_app/controller/weatherservice/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

double latuser = 0.0;
double lonuser = 0.0;

var allHeight;
var allWidth;

const apiKey = 'ac8fd06439a8c2fa55bc9cdda377675b';
const apiKey2 = '1851339ee4961ffd55df1886d56761fa';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;
    latuser = latitude;
    lonuser = longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    NetworkHelper networkHelper2 = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&appid=$apiKey2&units=metric');

    var weatherData = await networkHelper.getData();
    var daysWeatherData = await networkHelper2.getData();
    const List<String> attractions = [
      'operavebale',
      'plajlar',
      'kuleanitveheykeller',
      'muzeler',
    ];

    // Looping and Fetching the Data from the APIs.
    for (String attraction in attractions) {
      var data = await getCityAttraction(attraction);
      for (int i = 0; i < data['kayit_sayisi']; i++) {
        attractionlist.add(
          Attraction(
            district: data['onemliyer'][i]['MAHALLE'],
            title: data['onemliyer'][i]['ADI'],
            lat: data['onemliyer'][i]['ENLEM'],
            lon: data['onemliyer'][i]['BOYLAM'],
            category: attraction,
          ),
        );
      }
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyHomePage(
        locationWeather: weatherData,
        daysWeather: daysWeatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    allHeight = height;
    allWidth = width;

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
