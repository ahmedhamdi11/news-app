import 'package:flutter/material.dart';
import 'package:news_app/widgets/home_screen_tabs.dart';
import 'package:news_app/widgets/pagination_control.dart';
import 'package:news_app/widgets/sortyby_drop_menu.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          HomeScreenTabs(),
          SizedBox(height: 16.0),
          PaginationControl(),
          SizedBox(height: 16.0),
          SortByDropMenu(),
        ],
      ),
    );
  }
}
