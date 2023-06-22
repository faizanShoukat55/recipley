import 'parent/model.dart';

///
///App Default Settings
///

class Setting extends Model {
  String? appName;
  String? defaultTheme;
  String? mainColor;
  String? mainDarkColor;
  String? secondColor;
  String? scaffoldColor;
  String? textLightColor;
  String? textDarkColor;
  String? hintColor;
  String? dangerColor;
  String? successColor;
  String? warningColor;
  String? appVersion;
  bool? enableVersion;


  Setting(
      {this.appName,
        this.defaultTheme,
      this.mainColor,
        this.mainDarkColor,
      this.secondColor,
      this.scaffoldColor,
        this.textLightColor,
        this.textDarkColor,
        this.hintColor,
        this.dangerColor,
        this.successColor,
        this.warningColor,
      this.appVersion,
      this.enableVersion,});

  Setting.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    defaultTheme = json['default_theme'];
    mainColor = json['main_color'];
    mainDarkColor=json['main_dark_color'];
    secondColor = json['second_color'];
    scaffoldColor = json['scaffold_color'];
    textLightColor=json['text_light_color'];
    textDarkColor=json['text_dark_color'];
    hintColor=json['hint_color'];
    dangerColor=json['danger_color'];
    successColor=json['success_color'];
    warningColor=json['warning_color'];
    appVersion = json['app_version'];
    enableVersion = boolFromJson(json, 'enable_version');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_name'] = appName;
    data['default_theme'] = defaultTheme;

    data['main_color'] = mainColor;
    data['main_dark_color']=mainDarkColor;
    data['second_color'] = secondColor;
    data['scaffold_color'] = scaffoldColor;

    data['text_light_color']=textLightColor;
    data['text_dark_color']=textDarkColor;
    data['hint_color']=hintColor;
    data['danger_color']=dangerColor;
    data['success_color']=successColor;
    data['warning_color']=warningColor;

    data['app_version'] = appVersion;
    data['enable_version'] = enableVersion;
    return data;
  }
}
