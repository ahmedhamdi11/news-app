import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/widgets/home_widgets/all_news_view.dart';
import 'package:news_app/widgets/home_widgets/home_screen_tabs.dart';
import 'package:news_app/widgets/home_widgets/top_trending_view.dart';
import 'package:provider/provider.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    NewsType newsType = Provider.of<HomeProvider>(context).newsType;
    return Column(
      children: [
        const HomeScreenTabs(),
        const SizedBox(
          height: 16.0,
        ),
        newsType == NewsType.allNews
            ? const Expanded(child: AllNewsView())
            : const TopTrendingView(),
      ],
    );
  }
}
