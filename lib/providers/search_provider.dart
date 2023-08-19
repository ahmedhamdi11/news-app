import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constents/constants.dart';
import 'package:news_app/constents/enums.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/errors/failures.dart';
import 'package:news_app/utils/services/api_services.dart';

class SearchProvider extends ChangeNotifier {
  ApiServices apiServices = ApiServices();

  late final TextEditingController searchController;

  ApiStatsEnum searchState = ApiStatsEnum.initialState;
  List<NewsModel> searchData = [];
  String searchErrMessage = '';

  void resetSearchStateToInit() {
    searchState = ApiStatsEnum.initialState;
    notifyListeners();
  }

  // fetch search data
  Future<void> fetchSearchData({required String query}) async {
    searchState = ApiStatsEnum.loading;
    searchData = [];
    notifyListeners();
    try {
      Response response = await apiServices.get(
        endPoint: 'everything?q=$query&pageSize=20',
        headers: {'X-Api-Key': kApiKey},
      );

      for (var item in response.data['articles']) {
        searchData.add(NewsModel.fromJson(item));
      }
      searchState = ApiStatsEnum.success;
      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        Failures failures = ServerFailure.fromDioError(e);
        searchErrMessage = failures.errMessage;
        searchState = ApiStatsEnum.failure;
        notifyListeners();
      } else {
        searchErrMessage = e.toString();
        searchState = ApiStatsEnum.failure;
        notifyListeners();
      }
    }
  }
}
