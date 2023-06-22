import 'dart:convert' as convert;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recipley/utils/ui.dart';

class Helper{
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.showSnackbar(Ui.defaultSnackBar(message: "Tap again to leave!".tr));
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }
}