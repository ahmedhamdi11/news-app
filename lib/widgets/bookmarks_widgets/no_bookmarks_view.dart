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
              FadeEffect(),
            ],
            child: Image.asset('assets/images/bookmark.png'),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
