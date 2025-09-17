import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingServices{
  static late SharedPreferences sharedPref;

  static Future initSharedPreferences() async{
    sharedPref = await SharedPreferences.getInstance();
  }

  static bool isFirstTime(){
    bool isFirsTime = sharedPref.getBool('isFirsTime') ?? true;
    return isFirsTime;
  }

  static setFirstTimeWithFalse(){
    sharedPref.setBool('isFirsTime', false);
  }


}