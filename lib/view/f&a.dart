import 'package:city_guide_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:city_guide_app/fadeanimation.dart';

class FAScreen extends StatefulWidget {
  const FAScreen({super.key});

  @override
  State<FAScreen> createState() => _FAScreenState();
}

class _FAScreenState extends State<FAScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(
              0.4,
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/hotel.webp'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.2),
                  ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const FadeAnimation(
                          1,
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "What would you like to find?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.3,
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            margin: const EdgeInsets.only(left: 70, right: 70),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  hintText:
                                      "Search for hotels, restaurants ..."),
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Restaurants", style: topicTextStyle),
                          Text('>', style: topicTextStyle),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.4,
                      SizedBox(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeItem(
                                image: 'assets/images/restaurant1.jpg',
                                title: 'Aquarium Mezzes'),
                            makeItem(
                                image: 'assets/images/restaurant2.jpg',
                                title: 'Mengoli Burgers'),
                            makeItem(
                                image: 'assets/images/restaurant3.jpg',
                                title: 'Adabeyi Balik'),
                            makeItem(
                                image: 'assets/images/restaurant4.jpg',
                                title: 'Qoch Steak')
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Hotels",
                            style: topicTextStyle,
                          ),
                          Text(
                            '>',
                            style: topicTextStyle,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.4,
                      SizedBox(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            makeItem(
                                image: 'assets/images/hotel1.jpg',
                                title: 'Marriott'),
                            makeItem(
                                image: 'assets/images/hotel2.jpg',
                                title: 'Swissotel Buyuk Efes'),
                            makeItem(
                                image: 'assets/images/hotel3.jpg',
                                title: 'Park Inn by Radisson'),
                            makeItem(
                                image: 'assets/images/hotel4.jpg',
                                title: 'Coordinat Suits')
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ])),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
