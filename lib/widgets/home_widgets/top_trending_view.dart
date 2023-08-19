import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/widgets/error_view_widget.dart';
import 'package:news_app/widgets/home_widgets/top_trending_article_item.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:news_app/widgets/shimmer_widgets/top_trending_shimmer.dart';
import 'package:provider/provider.dart';

class TopTrendingView extends StatelessWidget {
  const TopTrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    switch (homeProvider.fetchTopTrendingState) {
      case ApiStatsEnum.loading:
        return const TopTrendingShimmer();

      case ApiStatsEnum.failure:
        return ErrorViewWidget(
          errMessage: homeProvider.topTrendingErrMessage,
          onButtonPressed: () => homeProvider.getTopTrending(),
        );

      case ApiStatsEnum.success:
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
                      itemCount: homeProvider.topTrendingData.length,
                      itemBuilder: (context, index) => TopTrendingArticleItem(
                        news: homeProvider.topTrendingData[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );

      default:
        return const SizedBox();
    }
  }
}
