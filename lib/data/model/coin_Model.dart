// To parse this JSON data, do
//
//     final coinModel = coinModelFromJson(jsonString);

import 'dart:convert';

CoinModel coinModelFromJson(String str) => CoinModel.fromJson(json.decode(str));

String coinModelToJson(CoinModel data) => json.encode(data.toJson());

class CoinModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  num? currentPrice;
  int? marketCap;
  int? marketCapRank;
  int? fullyDilutedValuation;
  int? totalVolume;
  num? high24H;
  num? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  num? marketCapChange24H;
  double? marketCapChangePercentage24H;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  int? ath;
  double? athChangePercentage;
  DateTime? athDate;
  double? atl;
  double? atlChangePercentage;
  DateTime? atlDate;
  dynamic roi;
  DateTime? lastUpdated;

  CoinModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.roi,
    this.lastUpdated,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
    id: json["id"],
    symbol: json["symbol"],
    name: json["name"],
    image: json["image"],
    currentPrice: json["current_price"],
    marketCap: json["market_cap"],
    marketCapRank: json["market_cap_rank"],
    fullyDilutedValuation: json["fully_diluted_valuation"],
    totalVolume: json["total_volume"],
    high24H: json["high_24h"],
    low24H: json["low_24h"],
    priceChange24H: json["price_change_24h"]?.toDouble(),
    priceChangePercentage24H: json["price_change_percentage_24h"]?.toDouble(),
    marketCapChange24H: json["market_cap_change_24h"],
    marketCapChangePercentage24H: json["market_cap_change_percentage_24h"]?.toDouble(),
    circulatingSupply: json["circulating_supply"],
    totalSupply: json["total_supply"],
    maxSupply: json["max_supply"],
    roi: json["roi"],
    lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbol": symbol,
    "name": name,
    "image": image,
    "current_price": currentPrice,
    "market_cap": marketCap,
    "market_cap_rank": marketCapRank,
    "fully_diluted_valuation": fullyDilutedValuation,
    "total_volume": totalVolume,
    "high_24h": high24H,
    "low_24h": low24H,
    "price_change_24h": priceChange24H,
    "price_change_percentage_24h": priceChangePercentage24H,
    "market_cap_change_24h": marketCapChange24H,
    "market_cap_change_percentage_24h": marketCapChangePercentage24H,
    "circulating_supply": circulatingSupply,
    "total_supply": totalSupply,
    "max_supply": maxSupply,
    "ath": ath,
    "ath_change_percentage": athChangePercentage,
    "ath_date": athDate?.toIso8601String(),
    "atl": atl,
    "atl_change_percentage": atlChangePercentage,
    "atl_date": atlDate?.toIso8601String(),
    "roi": roi,
    "last_updated": lastUpdated?.toIso8601String(),
  };
}
