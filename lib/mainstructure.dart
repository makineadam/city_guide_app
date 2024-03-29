import 'package:city_guide_app/view/attractions.dart';
import 'package:city_guide_app/view/f&a.dart';
import 'package:city_guide_app/view/homepage.dart';
import 'package:city_guide_app/view/news.dart';
import 'package:city_guide_app/view/transportation_card.dart';
import 'package:city_guide_app/variables.dart';
import 'package:city_guide_app/controller/weatherservice/location.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.locationWeather, this.daysWeather});

  final dynamic locationWeather;
  final dynamic daysWeather;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  late dynamic weather = widget.locationWeather;
  late dynamic weatherdays = widget.daysWeather;

  late List<Widget> screens = [
    HomePage(locationWeather: weather, daysWeather: weatherdays),
    NewsScreen(),
    AttractionsScreen(),
    FAScreen(),
    TransportationCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            selectedIndex: index,
            onTabChange: (index) => setState(() {
              this.index = index;
            }),
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: themeColor,
            tabBackgroundColor: Color.fromARGB(255, 44, 44, 44),
            padding: EdgeInsets.all(12),
            gap: 8,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(icon: Icons.newspaper, text: 'News'),
              GButton(icon: Icons.attractions, text: 'Attractions'),
              GButton(
                icon: Icons.food_bank,
                text: 'F&A',
              ),
              GButton(
                icon: Icons.credit_card,
                text: 'TCard',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
