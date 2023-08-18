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
  late ApiStatsEnum apiStatsEnum;
  ApiServices apiServices = ApiServices();
  String errMessage = '';

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
    notifyListeners();
  }

  Future getAllNews() async {
    apiStatsEnum = ApiStatsEnum.loading;
    notifyListeners();
    try {
      Response response = await apiServices.get(
        endPoint: 'everything?q=technology&language=en&pageSize=10',
        headers: {'X-Api-Key': kApiKey},
      );
      if (response.data['status'] == 'error') {
        errMessage = response.data['message'];
        apiStatsEnum = ApiStatsEnum.failure;
        notifyListeners();
      } else {
        for (var item in response.data['articles']) {
          allNewsData.add(NewsModel.fromJson(item));
        }
        apiStatsEnum = ApiStatsEnum.success;
        notifyListeners();
      }
    } catch (e) {
      if (e is DioException) {
        Failures failures = ServerFailure.fromDioError(e);
        errMessage = failures.errMessage;
        apiStatsEnum = ApiStatsEnum.failure;
        notifyListeners();
      } else {
        errMessage = e.toString();
        apiStatsEnum = ApiStatsEnum.failure;
        notifyListeners();
      }
    }
  }
}
