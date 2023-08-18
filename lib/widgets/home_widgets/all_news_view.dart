import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/widgets/error_view_widget.dart';
import 'package:news_app/widgets/home_widgets/articles_listview.dart';
import 'package:news_app/widgets/home_widgets/pagination_control.dart';
import 'package:news_app/widgets/home_widgets/sortyby_drop_menu.dart';
import 'package:news_app/widgets/shimmer_widgets/all_news_shimmer.dart';
import 'package:provider/provider.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          PaginationController(),
          SizedBox(height: 16.0),
          SortByDropMenu(),
          SizedBox(height: 16.0),
          Expanded(child: AllNewsViewBody()),
        ],
      ),
    );
  }
}

class AllNewsViewBody extends StatelessWidget {
  const AllNewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    switch (homeProvider.apiStatsEnum) {
      case ApiStatsEnum.loading:
        return const AllNewsShimmer();

      case ApiStatsEnum.failure:
        return ErrorViewWidget(
          onBottonPressed: () => homeProvider.getAllNews(),
          errMessage: homeProvider.errMessage,
        );

      case ApiStatsEnum.success:
        return ArticlesListView(
          allNews: homeProvider.allNewsData,
        );
    }
  }
}
