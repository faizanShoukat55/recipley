import 'package:get/get.dart';
import 'package:recipley/providers/json_data_provider.dart';

import '../models/setting_model.dart';

class SettingRepository {
  JsonApiClient? _jsonApiClient;

  SettingRepository() {
    _jsonApiClient = Get.find<JsonApiClient>();
  }

  Future<Setting> get() {
    return _jsonApiClient!.getAppSettings();
  }
}
