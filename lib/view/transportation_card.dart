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
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeColor,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30, top: 70),
                child: const Text(
                  'Transportation Card',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
              ),
              Image(
                image: AssetImage('assets/images/transportcard.png'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 70, right: 70),
                width: size.width,
                height: 100,
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
                child: Center(
                  child: Text(
                    'Purchase Card',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
