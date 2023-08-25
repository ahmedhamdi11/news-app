import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NoBookmarksView extends StatelessWidget {
  const NoBookmarksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // image
          Animate(
            effects: const [
              SlideEffect(
                begin: Offset(1, 0),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1500),
              ),
              FadeEffect(duration: Duration(milliseconds: 1200)),
            ],
            child: Image.asset(
              'assets/images/newspaper.png',
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // text
          Animate(
            effects: const [
              SlideEffect(
                begin: Offset(0, 5),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1500),
              ),
              FadeEffect(),
            ],
            child: const Text(
              'No bookmarks yet!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }
}
