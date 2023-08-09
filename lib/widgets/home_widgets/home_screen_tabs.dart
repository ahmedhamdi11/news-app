import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenTabs extends StatelessWidget {
  const HomeScreenTabs({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        height: 48.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            TabWidget(
              text: 'All news',
              isSelected: homeProvider.newsType == NewsType.allNews,
              onTap: () => homeProvider.changeNewsTypeToAllNews(),
            ),
            const SizedBox(width: 16.0),
            TabWidget(
              text: 'Top trending',
              isSelected: homeProvider.newsType == NewsType.topTrending,
              onTap: () => homeProvider.changeNewsTypeToTopTrending(),
            ),
          ],
        ),
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
          duration: const Duration(milliseconds: 150),
          curve: Curves.linear,
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
