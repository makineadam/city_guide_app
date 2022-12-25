import 'package:city_guide_app/controller/apiservice/api_service.dart';
import 'package:city_guide_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:city_guide_app/components/custom_list_tile.dart';
import 'package:city_guide_app/model/article_model.dart';
import 'package:city_guide_app/fadeanimation.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.3,
      Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(top: 21),
              child: Text(
                'News',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        backgroundColor: themeColor,
        //Now let's call the APi services with futurebuilder wiget
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            //let's check if we got a response or not
            if (snapshot.hasData) {
              //Now let's make a list of articles
              List<Article> articles = snapshot.data ?? <Article>[];
              return ListView.builder(
                //Now let's create our custom List tile
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
