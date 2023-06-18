
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:weather_app/provider/dashboard_provider.dart';
import 'package:weather_app/screens/home/home_page.dart';
import 'package:weather_app/util/theme/text.style.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, this.locationName = ""}) : super(key: key);
  final String? locationName;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController controller = PageController();


  @override
  Widget build(BuildContext context) {

    return Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) =>
            WillPopScope(
              onWillPop: () async {
                if (dashboardProvider.selectIndex != 0) {
                  controller.jumpToPage(0);
                  return false;
                } else {
                  if (dashboardProvider.backButtonPressCount >= 2) {
                    return dashboardProvider.showExitPopup(context);
                  } else {
                    dashboardProvider.incrementBackButtonPressCount();
                    return false;
                  }
                }
              },
              child: Scaffold(
                  backgroundColor: Colors.white,
                  bottomNavigationBar: StylishBottomBar(
                    option:  AnimatedBarOptions(
                      // iconSize: 32,
                      barAnimation: BarAnimation.fade,
                      iconStyle: IconStyle.animated,
                      opacity: 0.3,

                    ),
                    items: [
                      BottomBarItem(
                        icon: InkWell(
                            child: const Icon(Icons.bar_chart)),
                        title:  Text('Market',style: latoStyle700Bold.copyWith(color: Colors.teal),),

                        backgroundColor: Colors.green,
                        selectedIcon: const Icon(Icons.read_more),
                      ),
                      BottomBarItem(
                        icon: const Icon(Icons.history),
                        title: const Text('History'),
                        backgroundColor: Colors.red,
                      ),


                    ],
                    hasNotch: true,
                    currentIndex: dashboardProvider.selectIndex,
                    onTap: (index) {
                      controller.animateToPage(
                          index, duration: const Duration(seconds: 1),
                          curve: Curves.easeOut);
                      dashboardProvider.changeSelectIndex(index);
                    },
                  ),
                  body: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                            controller: controller,
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (page) {
                              if (page != 0) {
                                dashboardProvider.resetBackButtonPress();
                              }
                              dashboardProvider.changeSelectIndex(page);
                            },
                            children: const [
                              HomePageScreen(),

                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ));

  }



  Widget tabItem(IconData iconData, int position, DashboardProvider dashboardProvider, {bool isCircle = false}) {
    return Expanded(
        child: InkWell(
          onTap: () {
            dashboardProvider.changeSelectIndex(position);
            controller.animateToPage(position, duration: const Duration(seconds: 1), curve: Curves.easeOut);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              !isCircle
                  ? Tab(
                  icon: Icon(iconData,
                      size: 30.0, color: dashboardProvider.selectIndex == position ? Colors.blue : Colors.grey.withOpacity(.8)))
                  : Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: dashboardProvider.selectIndex == position ? Colors.blue : Colors.grey.withOpacity(.8), width: 2.0)),
                  child: Tab(
                      icon: Icon(iconData,
                          size: 25.0, color: dashboardProvider.selectIndex == position ? Colors.blue : Colors.grey.withOpacity(.8)))),
              Container(
                height: 3,
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                    color: dashboardProvider.selectIndex == position ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ));
  }
}