import 'package:flutter/material.dart';
import 'package:news_app/widgets/home_widgets/articles_listview.dart';
import 'package:news_app/widgets/home_widgets/pagination_control.dart';
import 'package:news_app/widgets/home_widgets/sortyby_drop_menu.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          PaginationControl(),
          SizedBox(height: 16.0),
          SortByDropMenu(),
          SizedBox(height: 16.0),
          Expanded(child: ArticlesListView()),
        ],
      ),
    );
  }
}
