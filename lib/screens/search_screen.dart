import 'package:flutter/material.dart';
import 'package:news_app/widgets/search_widgets/custom_search_bar.dart';
import 'package:news_app/widgets/search_widgets/search_suggestions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 8.0),
              CustomSearchBar(),
              SearchSuggestions(),
            ],
          ),
        ),
      ),
    );
  }
}
