import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BookmarksListView extends StatelessWidget {
  const BookmarksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 16.0, left: 12.0, right: 12.0),
        itemCount: 20,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(milliseconds: 150),
          child: SlideAnimation(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: 90.0,
            verticalOffset: 120.0,
            child: FadeInAnimation(
                duration: const Duration(seconds: 3),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Container() // ArticleItme(),
                ),
          ),
        ),
      ),
    );
  }
}
