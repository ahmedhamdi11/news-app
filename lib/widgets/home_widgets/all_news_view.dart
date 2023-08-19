import 'package:flutter/material.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/widgets/articles_listview.dart';
import 'package:news_app/widgets/error_view_widget.dart';
import 'package:news_app/widgets/home_widgets/pagination_control.dart';
import 'package:news_app/widgets/home_widgets/sortyby_drop_menu.dart';
import 'package:news_app/widgets/shimmer_widgets/articles_shimmer.dart';
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

    switch (homeProvider.fetchAllNewsState) {
      case ApiStatsEnum.loading:
        return const ArticlesShimmer();

      case ApiStatsEnum.failure:
        return ErrorViewWidget(
          onButtonPressed: () => homeProvider.getAllNews(),
          errMessage: homeProvider.allNewsErrMessage,
        );

      case ApiStatsEnum.success:
        return ArticlesListView(
          news: homeProvider.allNewsData,
        );

      default:
        return const SizedBox();
    }
  }
}
