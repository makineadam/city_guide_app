import 'package:city_guide_app/screens/f&a.dart';
import 'package:city_guide_app/screens/homepage.dart';
import 'package:city_guide_app/screens/news.dart';
import 'package:city_guide_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:city_guide_app/screens/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: themeColor,
      home: LoadingScreen(),
    );
  }
}
