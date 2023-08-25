import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/screens/bookmarks_screen.dart';
import 'package:news_app/utils/cusom_page_route_tranition.dart';
import 'package:news_app/utils/functions/show_snackbar.dart';
import 'package:provider/provider.dart';

class BookmarksProvider extends ChangeNotifier {
  List<NewsModel> bookmarks = [];

  toggleBookmark(BuildContext context, {required NewsModel article}) async {
    Box<NewsModel> box = Hive.box<NewsModel>('news_box');
    if (isInBookmarks(article)) {
      deleteBookmark(context, article);
    } else {
      box.add(article).then(
            (value) => showMySnackBar(
              context,
              content: 'added to bookmarks',
              backgroundColor: Theme.of(context).cardColor,
              contentColor: Provider.of<ThemeProvider>(
                context,
                listen: false,
              ).isDarkTheme
                  ? Colors.white
                  : Colors.black,
              action: SnackBarAction(
                label: 'Go to bookmarks',
                textColor: Theme.of(context).colorScheme.secondary,
                backgroundColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                onPressed: () => Navigator.of(context).push(
                  CustomPageRouteTransition(
                    page: const BookmarksScreen(),
                  ),
                ),
              ),
            ),
          );
    }
    await getBookmarks();
  }

  void deleteBookmark(BuildContext context, NewsModel article) async {
    Box<NewsModel> box = Hive.box<NewsModel>('news_box');
    await box
        .deleteAt(
          bookmarks.indexWhere(
            (element) =>
                element.url == article.url &&
                element.publishedAt == article.publishedAt,
          ),
        )
        .then(
          (value) => showMySnackBar(
            context,
            content: 'Removed from bookmarks',
            backgroundColor: Theme.of(context).cardColor,
            contentColor: Provider.of<ThemeProvider>(
              context,
              listen: false,
            ).isDarkTheme
                ? Colors.white
                : Colors.black,
            action: SnackBarAction(
              label: 'UNDO',
              textColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                box.add(article);
                getBookmarks();
              },
            ),
          ),
        );
    getBookmarks();
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
