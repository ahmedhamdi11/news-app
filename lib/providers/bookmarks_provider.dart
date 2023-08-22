import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/models/news_model.dart';

class BookmarksProvider extends ChangeNotifier {
  List<NewsModel> bookmarks = [];

  toggleBookmark({required NewsModel article}) async {
    Box<NewsModel> box = Hive.box<NewsModel>('news_box');
    if (isInBookmarks(article)) {
      deleteBookmark(article);
    } else {
      await box.add(article);
    }
    await getBookmarks();
  }

  void deleteBookmark(NewsModel article) async {
    Box<NewsModel> box = Hive.box<NewsModel>('news_box');
    await box.deleteAt(
      bookmarks.indexWhere(
        (element) =>
            element.url == article.url &&
            element.publishedAt == article.publishedAt,
      ),
    );
    await getBookmarks();
  }

  getBookmarks() async {
    Box<NewsModel> box = Hive.box<NewsModel>('news_box');
    bookmarks = box.values.toList();
    notifyListeners();
  }

  bool isInBookmarks(NewsModel article) {
    return bookmarks.any(
      (element) =>
          element.url == article.url &&
          element.publishedAt == article.publishedAt,
    );
  }
}
