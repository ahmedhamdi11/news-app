import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/widgets/animated_tab_widget.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  NewsType newsType = NewsType.allNews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              CustomAnimatedTab(
                text: 'All news',
                isSelected: newsType == NewsType.allNews,
                onTap: () {
                  newsType = NewsType.allNews;
                  setState(() {});
                },
              ),
              const SizedBox(width: 16.0),
              CustomAnimatedTab(
                text: 'Top trending',
                isSelected: newsType == NewsType.topTrending,
                onTap: () {
                  newsType = NewsType.topTrending;
                  setState(() {});
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
