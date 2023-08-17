import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/widgets/home_widgets/articles_item.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(milliseconds: 150),
          child: const SlideAnimation(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 90,
            verticalOffset: 120.0,
            child: FadeInAnimation(
              duration: Duration(seconds: 3),
              curve: Curves.fastLinearToSlowEaseIn,
              //flipAxis: FlipAxis.y,
              child: ArticleItme(),
            ),
          ),
        ),
      ),
    );
  }
}
