import 'package:flutter/material.dart';
import 'package:news_app/constents/constants.dart';
import 'package:news_app/widgets/search_widgets/search_suggestion_item.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(
            kSearchKeywords.length, // replace with your dynamic data length
            (index) {
              // replace with your dynamic data
              return SearchSuggestionItem(
                text: kSearchKeywords[index],
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}
