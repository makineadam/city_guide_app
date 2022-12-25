import 'package:city_guide_app/controller/attractionservice/attraction_service.dart';
import 'package:city_guide_app/model/attractions_model.dart';
import 'package:city_guide_app/variables.dart';
import 'package:flutter/material.dart';

class AttractionsScreen extends StatelessWidget {
  AttractionsScreen({super.key});

  List<Attraction> mainsofattraction = attractionlist;

  @override
  Widget build(BuildContext context) {
    mainsofattraction.sort((a, b) => a.distance.compareTo(b.distance));
    return SafeArea(
      child: Scaffold(
          backgroundColor: themeColor,
          body: ListView.builder(
            itemCount: mainsofattraction.length,
            itemBuilder: (context, index) {
              return AttractionCard(
                  image: mainsofattraction[index].imageurl,
                  title: mainsofattraction[index].title,
                  distance:
                      mainsofattraction[index].distance.toStringAsFixed(2));
            },
          )),
    );
  }
}

class AttractionCard extends StatelessWidget {
  const AttractionCard({
    Key? key,
    required this.image,
    required this.title,
    required this.distance,
  }) : super(key: key);

  final String image;
  final String title;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Image(
              image: AssetImage(image),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text('$distance km away')
            ],
          )
        ],
      ),
    );
  }
}
