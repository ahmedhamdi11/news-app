import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';

class HomeProvider extends ChangeNotifier {
  NewsType newsType = NewsType.allNews;
  String sortBy = SortByEnum.popularity.name;

  changeNewsTypeToAllNews() {
    newsType = NewsType.allNews;
    notifyListeners();
  }

  changeNewsTypeToTopTrending() {
    newsType = NewsType.topTrending;
    notifyListeners();
  }

  void sortByOnChanged(String value) {
    sortBy = value;
    notifyListeners();
  }
}
