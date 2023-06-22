import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ui{


  static BoxDecoration getBoxDecoration(
      {Color? color, double? radius, Border? border, Gradient? gradient}) {
    return BoxDecoration(
      color: color ?? Get.theme.backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
      boxShadow: [
        BoxShadow(
            color: Get.theme.primaryColorDark.withOpacity(0.08),
            blurRadius: 1,
            offset: const Offset(0, 1)),
      ],
      border: border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
      gradient: gradient,
    );
  }

  static InputDecoration getInputDecoration(
      {String hintText = '',
        String? errorText,
        IconData? iconData,
        Widget? suffixIcon,
        Widget? suffix}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.caption,
      prefixIcon: iconData != null ? Icon(iconData, color: Get.theme.primaryColorDark,size: 22,).marginOnly(right: 14)
          : const SizedBox(),
      prefixIconConstraints: iconData != null
          ? const BoxConstraints.expand(width: 28, height: 28)
          : const BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(0),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }

  static GetSnackBar successSnackBar(
      {String title = 'Success', String? message}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message??"",
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon: Icon(Icons.check_circle_outline,
          size: 32, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: Duration(seconds: 5),
    );
  }

  static GetSnackBar defaultSnackBar({String title = 'Alert', String? message}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      titleText: Text(title,
          style: Get.textTheme.headline6
              ?.merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message??"",
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColorDark,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(Icons.warning_amber_rounded,
          size: 32, color: Get.theme.hintColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }


  static GetSnackBar ErrorSnackBar({String title = 'Error', String? message}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message??"Some thing went wrong.",
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: Icon(Icons.remove_circle_outline,
          size: 32, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: Duration(seconds: 5),
    );
  }

  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }
}