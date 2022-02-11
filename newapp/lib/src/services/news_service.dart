import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newapp/src/models/category_model.dart';
import 'package:newapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final String _URL_NEWS = 'https://newsapi.org/v2';
final String _API_KEY = 'cdfb5164a0ef46cd86039b2539115cdc';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  String _selectedCategory = 'business';
  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();
    this.categories.forEach((element) => this.categoryArticles[element.name] = List());
  }

  String get selectedCategory => this._selectedCategory;

  set selectedCategory(String value) {
    this._selectedCategory = value;
    this.getArticlesByCategory(this._selectedCategory);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY';
    final result = await http.get(url);
    final newsResponse = newsResponseFromJson(result.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) return this.categoryArticles[category];
    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY&category=$category';
    final result = await http.get(url);
    final newsResponse = newsResponseFromJson(result.body);
    this.categoryArticles[category].addAll(newsResponse.articles);
    notifyListeners();
  }

  List<Article> get getArticleCategorySelected => this.categoryArticles[this.selectedCategory];
}
