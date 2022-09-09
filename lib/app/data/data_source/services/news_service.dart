import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:tesis_1/app/domain/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '3429d07d7c4b43308b6ae5ab2e50871c';

class NewsService extends SimpleNotifier {
  List<Article> headlines = [];
  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url =
        '$_URL_NEWS/everything?qInTitle=Banco Central de Chile&pageSize=10&apiKey=$_APIKEY';
    final res = await http.get(Uri.parse(url));
    final newsResponse = newResponseFromJson(res.body);

    this.headlines.addAll(newsResponse.articles);
    notify();
  }
}
