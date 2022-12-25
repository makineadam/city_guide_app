import 'dart:convert';
import 'package:city_guide_app/model/article_model.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=ea0158d0abe443c7bce050163a3704f1";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    //f200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //putting different articles into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
