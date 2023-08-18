import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/home_widgets/articles_item.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key, required this.allNews});
  final List<NewsModel> allNews;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: allNews.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(milliseconds: 150),
          child: SlideAnimation(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 90,
            verticalOffset: 120.0,
            child: FadeInAnimation(
              duration: const Duration(seconds: 3),
              curve: Curves.fastLinearToSlowEaseIn,
              //flipAxis: FlipAxis.y,
              child: ArticleItme(
                news: allNews[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
