import 'package:flutter/material.dart';
import 'package:weather_app/util/theme/text.style.dart';

class DashboardProvider with ChangeNotifier {
  int selectIndex = 0;

  changeSelectIndex(int value) {
    selectIndex = value;
    notifyListeners();
  }

  int backButtonPressCount = 0;

  resetBackButtonPress() {
    backButtonPressCount = 0;
    notifyListeners();
  }

  incrementBackButtonPressCount() {
    backButtonPressCount++;
    notifyListeners();
  }
  Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit Help Abode',style: latoStyle700Bold.copyWith(fontSize: 16),),
        content: Text('Do you want to exit an App?',style: latoStyle500Medium,),
        actions:[
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child:Text('No',style: latoStyle700Bold.copyWith(color: Colors.white),),
                ),
              ),
              SizedBox( width: 10,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child:Text('Yes',style:  latoStyle700Bold.copyWith(color: Colors.white),),
                ),
              ),
            ],
          )

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
}