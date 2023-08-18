import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/widgets/home_widgets/top_trending_article_item.dart';
import 'package:card_swiper/card_swiper.dart';

class TopTrendingView extends StatelessWidget {
  const TopTrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        AnimationConfiguration.synchronized(
          child: SlideAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(milliseconds: 1500),
            horizontalOffset: 60,
            verticalOffset: 80,
            child: FadeInAnimation(
              duration: const Duration(milliseconds: 1500),
              child: SizedBox(
                height: h * 0.55,
                child: Swiper(
                    itemWidth: w * 0.9,
                    layout: SwiperLayout.STACK,
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        const TopTrendingArticleItem()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
