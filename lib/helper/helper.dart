import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/animation/sideleft_toright..dart';
import 'package:weather_app/helper/animation/sideright_toleft.dart';
import 'package:weather_app/util/theme/apps_colors.dart';

showLog(message) {
  log("APP SAYS: $message");
}

class Helper {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static toScreen(context,screen) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => screen));
  }

  static List<BoxShadow> softUiShadow = [
    const BoxShadow(
      color: Colors.white,
      offset: Offset(-5, -5),
      spreadRadius: 1,
      blurRadius: 15,
    ),
    BoxShadow(
      color: const Color(0XFF748CAC).withOpacity(.6),
      offset: const Offset(5, 5),
      spreadRadius: 1,
      blurRadius: 15,
    ),
  ];

  static back(context) {
    Navigator.pop(context);
  }
  static toReplacementScreenSlideRightToLeft(screen) {
    Navigator.pushReplacement(navigatorKey.currentState!.context, SlideRightToLeft(page: screen));
  }

  static toReplacementScreenSlideLeftToRight(screen) {
    Navigator.pushReplacement(navigatorKey.currentState!.context, SlideLeftToRight(page: screen));
  }

  static toRemoveUntilScreen(screen) {
    Navigator.pushAndRemoveUntil(navigatorKey.currentState!.context, SlideRightToLeft(page: screen), (route) => false);
  }

  static onWillPop(screen) {
    Navigator.pushAndRemoveUntil(navigatorKey.currentState!.context, SlideRightToLeft(page: screen), (route) => false);
  }

  static showSnack(context, message, {color = colorPrimaryLight, duration = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message, style: const TextStyle(fontSize: 14)), backgroundColor: color, duration: Duration(seconds: duration)));
  }

  static circularProgress(context) {
    const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(colorPrimaryLight)));
  }

  static boxDecoration(Color color, double radius) {
    BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

}

