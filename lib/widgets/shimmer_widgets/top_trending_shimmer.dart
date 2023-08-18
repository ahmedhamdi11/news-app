import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/custom_shimmer.dart';

class TopTrendingShimmer extends StatelessWidget {
  const TopTrendingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: h * 0.54,
          child: Swiper(
            itemWidth: w * 0.9,
            layout: SwiperLayout.STACK,
            itemCount: 1,
            itemBuilder: (context, index) => const TopTrendingShimmerItem(),
          ),
        ),
      ],
    );
  }
}

class TopTrendingShimmerItem extends StatelessWidget {
  const TopTrendingShimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).cardColor,
      ),
      child: CustomShimmer(
        child: Column(
          children: [
            Container(
              width: w,
              height: w * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Theme.of(context).hintColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                width: w * 0.5,
                height: 28.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
