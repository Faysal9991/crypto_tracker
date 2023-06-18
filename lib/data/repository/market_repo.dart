import 'package:dio/dio.dart';
import 'package:weather_app/data/datasource/dio/dio_client.dart';
import 'package:weather_app/data/datasource/exception/api_error_handler.dart';
import 'package:weather_app/data/model/response/base/api_response.dart';
import 'package:weather_app/util/app_conostant.dart';

double progressPercent = 0;
class  MarketRepo{
  final DioClient dioClient;
  MarketRepo({required this.dioClient});

  //TODO: get Coin Details

  Future<ApiResponse>getMarketDetails( int page) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("&per_page=$page&page=1&sparkline=false&price_change_percentage=1&locale=en");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}