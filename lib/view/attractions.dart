import 'package:city_guide_app/controller/attractionservice/attraction_service.dart';
import 'package:city_guide_app/model/attractions_model.dart';
import 'package:city_guide_app/variables.dart';
import 'package:flutter/material.dart';

class AttractionsScreen extends StatefulWidget {
  const AttractionsScreen({super.key});

  @override
  State<AttractionsScreen> createState() => _AttractionsScreenState();
}

class _AttractionsScreenState extends State<AttractionsScreen> {
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
                distance: mainsofattraction[index].distance.toStringAsFixed(2),
                cardColor: mainsofattraction[index].color,
              );
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
    required this.cardColor,
  }) : super(key: key);

  final String image;
  final String title;
  final String distance;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      color: cardColor,
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
