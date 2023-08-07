import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';

class HomeScreenTabs extends StatefulWidget {
  const HomeScreenTabs({super.key});

  @override
  State<HomeScreenTabs> createState() => _HomeScreenTabsState();
}

class _HomeScreenTabsState extends State<HomeScreenTabs> {
  NewsType newsType = NewsType.allNews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TabWidget(
            text: 'All news',
            isSelected: newsType == NewsType.allNews,
            onTap: () {
              newsType = NewsType.allNews;
              setState(() {});
            },
          ),
          const SizedBox(width: 16.0),
          TabWidget(
            text: 'Top trending',
            isSelected: newsType == NewsType.topTrending,
            onTap: () {
              newsType = NewsType.topTrending;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.text,
    this.onTap,
    required this.isSelected,
  });
  final String text;
  final Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).cardColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: isSelected ? 20.0 : 14.0,
                fontWeight: FontWeight.w500,
              ),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
