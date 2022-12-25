import 'package:city_guide_app/model/article_model.dart';
import 'package:city_guide_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:city_guide_app/fadeanimation.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    child: FadeAnimation(
      1.3,
      Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(.5),
                offset: const Offset(0, 25),
                blurRadius: 10,
                spreadRadius: -12,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  //let's add the height

                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0)),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 173, 196, 238),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Text(
                article.source.name,
                style: const TextStyle(
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.title,
              style: const TextStyle(
                  fontSize: 15.0,
                  color: themeColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}
