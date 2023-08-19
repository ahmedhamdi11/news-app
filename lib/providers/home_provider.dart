import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constents/constants.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/errors/failures.dart';
import 'package:news_app/utils/services/api_services.dart';

class HomeProvider extends ChangeNotifier {
  NewsType newsType = NewsType.allNews;
  String sortBy = SortByEnum.popularity.name;
  List<NewsModel> allNewsData = [];
  List<NewsModel> topTrendingData = [];
  late ApiStatsEnum fetchAllNewsState;
  late ApiStatsEnum fetchTopTrendingState;
  ApiServices apiServices = ApiServices();
  String allNewsErrMessage = '';
  String topTrendingErrMessage = '';

  changeNewsTypeToAllNews() {
    newsType = NewsType.allNews;
    notifyListeners();
  }

  changeNewsTypeToTopTrending() {
    newsType = NewsType.topTrending;
    notifyListeners();
  }

  void sortByOnChanged(String value) {
    sortBy = value;
    getAllNews();
    notifyListeners();
  }

  Future<void> getAllNews({String pageNumber = '1'}) async {
    fetchAllNewsState = ApiStatsEnum.loading;
    allNewsData = [];
    notifyListeners();
    try {
      Response response = await apiServices.get(
        endPoint: 'everything?',
        queryParameters: {
          'q': 'technology',
          'language': 'en',
          'pageSize': '10',
          'page': pageNumber,
          'sortBy': sortBy,
        },
        headers: {'X-Api-Key': kApiKey},
      );
      for (var item in response.data['articles']) {
        allNewsData.add(NewsModel.fromJson(item));
      }
      fetchAllNewsState = ApiStatsEnum.success;
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        Failures failures = ServerFailure.fromDioError(e);
        allNewsErrMessage = failures.errMessage;
        fetchAllNewsState = ApiStatsEnum.failure;
        notifyListeners();
      } else {
        allNewsErrMessage = e.toString();
        fetchAllNewsState = ApiStatsEnum.failure;
        notifyListeners();
      }
    }
  }

  Future<void> getTopTrending() async {
    fetchTopTrendingState = ApiStatsEnum.loading;
    topTrendingData = [];
    notifyListeners();
    try {
      Response response = await apiServices.get(
        endPoint: 'top-headlines?category=technology&country=us&pageSize=20',
        headers: {'X-Api-Key': kApiKey},
      );

      for (var item in response.data['articles']) {
        topTrendingData.add(NewsModel.fromJson(item));
      }
      fetchTopTrendingState = ApiStatsEnum.success;
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        Failures failures = ServerFailure.fromDioError(e);
        topTrendingErrMessage = failures.errMessage;
        fetchTopTrendingState = ApiStatsEnum.failure;
        notifyListeners();
      } else {
        topTrendingErrMessage = e.toString();
        fetchTopTrendingState = ApiStatsEnum.failure;
        notifyListeners();
      }
    }
  }
}
