import 'package:flutter/material.dart';
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
        body: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 40),
                width: size.width * 0.8,
                height: size.height * 0.53,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text(
                        'Transportation Card',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 38),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Image(
                        image: AssetImage('assets/images/transport.png'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      width: size.width,
                      height: 70,
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
                      child: const Center(
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
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Tips and Tricks",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [TipsItem(), TipsItem(), TipsItem()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TipsItem extends StatelessWidget {
  const TipsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.all(20.0),
        height: size.height * 0.2,
        width: size.width * 0.25,
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
        child: const Text(
          loremipsum,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ));
  }
}
