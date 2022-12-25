import 'package:city_guide_app/variables.dart';
import 'package:flutter/material.dart';

class TransportationCard extends StatefulWidget {
  const TransportationCard({super.key});

  @override
  State<TransportationCard> createState() => _TransportationCardState();
}

class _TransportationCardState extends State<TransportationCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Do you want to purchase a local transport card?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 32),
            ),
            Image(
              image: AssetImage('assets/images/izmirimkart.png'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
