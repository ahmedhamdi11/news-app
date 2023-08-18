import 'package:dio/dio.dart';
import 'package:news_app/constents/constants.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.get(
      '$kBaseUrl$endPoint',
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }
}
