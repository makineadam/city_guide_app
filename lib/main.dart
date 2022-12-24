// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final screens = [
    'HomePage',
    'News',
    'Attractions',
    'F&A',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Color(0xFFF7F6EE)),
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
            activeColor: Color(0xFFF7F6EE),
            tabBackgroundColor: Color.fromARGB(255, 44, 44, 44),
            padding: EdgeInsets.all(12),
            gap: 8,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
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
            ],
          ),
        ),
      ),
    );
  }
}
