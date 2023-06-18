import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/market_provider.dart';
import 'package:weather_app/screens/home/widget/coin_card.dart';
import 'package:weather_app/util/theme/apps_colors.dart';
import 'package:weather_app/widgets/custom_appbar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  ScrollController controller = ScrollController();
int durationTime =  3;
  @override
  void initState() {
    Provider.of<MarketDetailsProvider>(context, listen: false).getMarketDetails();
  Stream.periodic(const Duration(minutes: 3)).listen((_) {
    Provider.of<MarketDetailsProvider>(context, listen: false).getMarketDetails();
  });
    controller.addListener(() {
      if (controller.offset >=
          controller.position.maxScrollExtent &&
          !controller.position.outOfRange &&
          Provider.of<MarketDetailsProvider>(context, listen: false).hasNextData) {
        Provider.of<MarketDetailsProvider>(context, listen: false).updatePageNo();
        print(
            "===================================>${Provider.of<MarketDetailsProvider>(context, listen: false).selectPage}");
      }
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Consumer<MarketDetailsProvider>(

        builder: (context, marketPro,child) {
          final double height = MediaQuery.of(context).size.height;
          final double width = MediaQuery.of(context).size.width;
          return Column(
            children: [
              customAppBar(title: "Market Details"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: ListView.builder(
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: marketPro.coinModel.length,
                      itemBuilder: (context,index){
                      return CoinCard(height: height, width: width, name: marketPro.coinModel[index].name!, symbol: marketPro.coinModel[index].symbol!, imageUrl:marketPro.coinModel[index].image!, price: marketPro.coinModel[index].currentPrice!.toDouble(), change: marketPro.coinModel[index].priceChange24H!, changePercentage: marketPro.coinModel[index].marketCapChangePercentage24H!,);
                      }),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
