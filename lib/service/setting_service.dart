import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/setting_model.dart';
import '../repositories/setting_repository.dart';
import '../utils/ui.dart';


///
/// Setting service to get app settings and information from json file
///

class SettingsService extends GetxService {
  final setting = Setting().obs;
  SettingRepository? _settingsRepo;

  SettingsService() {
    _settingsRepo = SettingRepository();
  }

  Future<SettingsService> init() async {
    ///Default Settings of the app
    setting.value = await _settingsRepo!.get();
    return this;
  }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        backgroundColor: Ui.parseColor(setting.value.scaffoldColor!),
        primaryColor: Ui.parseColor(setting.value.mainColor!),
        primaryColorDark: Ui.parseColor(setting.value.mainDarkColor!),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        dividerColor: Ui.parseColor(setting.value.hintColor!, opacity: 0.1),
        focusColor: Ui.parseColor(setting.value.mainColor!),
        hintColor: Ui.parseColor(setting.value.hintColor!),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Ui.parseColor(setting.value.mainDarkColor!)),
        ),
        colorScheme: ColorScheme.light(
          primary: Ui.parseColor(setting.value.mainColor!),
          secondary: Ui.parseColor(setting.value.secondColor!),
          background: Ui.parseColor(setting.value.scaffoldColor!),
          outline: Ui.parseColor(setting.value.hintColor!),
          error: Ui.parseColor(setting.value.dangerColor!)
        ),
        textTheme: GoogleFonts.getTextTheme(
          'Poppins',
          TextTheme(
            headline6: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Ui.parseColor(setting.value.textDarkColor!),
                height: 1.3),
            headline5: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Ui.parseColor(setting.value.textDarkColor!),
                height: 1.3),
            headline4: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Ui.parseColor(setting.value.textDarkColor!),
                height: 1.3),
            headline3: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Ui.parseColor(setting.value.textDarkColor!),
                height: 1.3),
            headline2: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: Ui.parseColor(setting.value.textDarkColor!),
                height: 1.4),
            headline1: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: Ui.parseColor(setting.value.textDarkColor!),
                height: 1.4),
            subtitle2: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Ui.parseColor(setting.value.textLightColor!),
                height: 1.2),
            subtitle1: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Ui.parseColor(setting.value.textLightColor!),
                height: 1.2),
            bodyText2: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: Ui.parseColor(setting.value.textDarkColor!),
                height: 1.2),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Ui.parseColor(setting.value.textDarkColor!),
                height: 1.2),
            caption: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                color: Ui.parseColor(setting.value.hintColor!),
                height: 1.2),
          ),
        ));
  }
}
