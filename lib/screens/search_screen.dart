import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:news_app/widgets/articles_listview.dart';
import 'package:news_app/widgets/error_view_widget.dart';
import 'package:news_app/widgets/search_widgets/custom_search_bar.dart';
import 'package:news_app/widgets/search_widgets/no_result_view.dart';
import 'package:news_app/widgets/search_widgets/search_suggestions.dart';
import 'package:news_app/widgets/shimmer_widgets/articles_shimmer.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: const Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 8.0),
                  CustomSearchBar(),
                  SearchScreenBody()

                  // Expanded(child: ErrorViewWidget(errMessage: 'test')),

                  //NoResultView()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<SearchProvider>(context).searchState) {
      case ApiStatsEnum.initialState:
        return const SearchSuggestions();

      case ApiStatsEnum.loading:
        // shimmer loading
        return const Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 12.0,
            ),
            child: ArticlesShimmer(),
          ),
        );

      case ApiStatsEnum.failure:
        return Expanded(
          child: ErrorViewWidget(
            errMessage: Provider.of<SearchProvider>(context).searchErrMessage,
          ),
        );

      case ApiStatsEnum.success:
        if (Provider.of<SearchProvider>(context).searchData.isEmpty) {
          return const NoResultView();
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 12.0,
            ),
            child: ArticlesListView(
              news: Provider.of<SearchProvider>(context).searchData,
            ),
          ),
        );
    }
  }
}
