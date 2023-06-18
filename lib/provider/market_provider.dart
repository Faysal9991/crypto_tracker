import 'package:flutter/material.dart';
import 'package:weather_app/data/model/coin_Model.dart';
import 'package:weather_app/data/model/response/base/api_response.dart';
import 'package:weather_app/data/repository/market_repo.dart';
import 'package:fluttertoast/fluttertoast.dart';





class MarketDetailsProvider with ChangeNotifier{
  final MarketRepo marketRepo;

  MarketDetailsProvider({required this.marketRepo});
  int position = 0;
  List<CoinModel> coinModel = [];
  bool isLoading = false;
  bool isBottomLoading = false;
  int selectPage = 10;
  bool hasNextData = false;


  updatePageNo() {
    selectPage++;
    getMarketDetails(page: selectPage);
    notifyListeners();
  }

  Future getMarketDetails({int page = 10, bool isFirstTime = true}) async {

    if (page == 1) {
      selectPage = 1;
      coinModel.clear();
      coinModel = [];
      isLoading = true;
      hasNextData = true;
      isBottomLoading = false;
      position = 0;
      if (!isFirstTime) {
      }
    } else {
      isBottomLoading = true;
    }

    ApiResponse response = await marketRepo.getMarketDetails(page);

    isLoading = false;
    isBottomLoading = false;
    if (response.response.statusCode == 200) {
      hasNextData = response.response.data!= null ? true : false;
      response.response.data.forEach((element) {
        coinModel.add(CoinModel.fromJson(element));
      });

    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }
    notifyListeners();
    return isLoading = true;

  }


}