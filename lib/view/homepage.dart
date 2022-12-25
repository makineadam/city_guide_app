import 'package:city_guide_app/controller/weatherservice/date.dart';
import 'package:flutter/material.dart';
import 'package:city_guide_app/variables.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.locationWeather, this.daysWeather});

  final locationWeather;
  final daysWeather;

  @override
  Widget build(BuildContext context) {
    String cityName = locationWeather['name'].toString();
    Date date = Date();
    String dayName = date.weekDayName();
    String dayInt = date.dayName().toString();
    String monthName = date.monthName();
    String dateDescription = '$dayName, $dayInt $monthName';

    Size size = MediaQuery.of(context).size;

    String weatherCondition = locationWeather['weather'][0]['main'];
    int temperatureInt = locationWeather['main']['temp'].toInt();
    String temperature = temperatureInt.toString();

    int windSpeed = locationWeather['wind']['speed'].toInt();
    int humidity = locationWeather['main']['humidity'].toInt();
    int feelsLike = locationWeather['main']['feels_like'].toInt();

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                cityName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 50.0),
              ),
              // ignore: prefer_const_constructors
              Text(
                dateDescription,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 23.0,
                ),
              ),
              const SizedBox(height: 90),
              //Weather
              Container(
                width: size.width,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(.5),
                        offset: const Offset(0, 25),
                        blurRadius: 10,
                        spreadRadius: -12,
                      )
                    ]),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Positioned(
                        top: -40,
                        left: 20,
                        child: Icon(
                          Icons.sunny,
                          size: 130,
                          color: Colors.black,
                        )),
                    Positioned(
                      bottom: 30,
                      left: 30,
                      child: Text(
                        weatherCondition,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                temperature,
                                style: const TextStyle(
                                    fontSize: 100, fontWeight: FontWeight.bold),
                              )),
                          const Text(
                            '°',
                            style: TextStyle(
                                fontSize: 100, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherItem(
                        value: windSpeed,
                        text: 'Wind Speed',
                        unit: 'km/h',
                        icon: Icons.air),
                    WeatherItem(
                        value: humidity,
                        text: 'Humidity',
                        unit: '%',
                        icon: Icons.water_drop),
                    WeatherItem(
                        value: feelsLike,
                        text: 'Feels Like',
                        unit: '°',
                        icon: Icons.person)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    Key? key,
    required this.value,
    required this.text,
    required this.unit,
    required this.icon,
  }) : super(key: key);

  final int value;
  final String text;
  final String unit;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(20.0),
          height: 85,
          width: 85,
          decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(0, 25),
                  blurRadius: 20,
                  spreadRadius: -25,
                )
              ]),
          child: Icon(icon, size: 45),
        ),
        const SizedBox(height: 8),
        Text(value.toString() + unit,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
