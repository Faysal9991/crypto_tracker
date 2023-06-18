

import 'package:flutter/material.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/util/theme/apps_colors.dart';
import 'package:weather_app/util/theme/text.style.dart';

Widget customAppBar({String? title}){
  return Container(
    height: 50,
    width: double.infinity,
     decoration: BoxDecoration(boxShadow: Helper.softUiShadow, color: Colors.white,borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
   child: Center(child: Text(title!,style: latoStyle700Bold.copyWith(fontSize: 16,color: AppColors.primaryColor),)),
  );
}
