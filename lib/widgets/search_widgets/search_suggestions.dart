import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:news_app/constents/constants.dart';
import 'package:news_app/widgets/search_widgets/search_suggestion_item.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(
          kSearchKeywords.length,
          (index) {
            return Animate(
              effects: [
                SlideEffect(
                  delay: Duration(milliseconds: 80 * index),
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 1500),
                ),
                const FadeEffect(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(seconds: 4),
                ),
              ],
              child: SearchSuggestionItem(
                text: kSearchKeywords[index],
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
