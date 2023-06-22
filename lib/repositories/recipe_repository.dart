import 'package:get/get.dart';
import 'package:recipley/models/dashboard_model.dart';
import 'package:recipley/providers/json_data_provider.dart';

import '../models/setting_model.dart';

class RecipeRepository {
  JsonApiClient? _jsonApiClient;

  RecipeRepository() {
    _jsonApiClient = Get.find<JsonApiClient>();
  }

  Future<List<CategoryModel>> getCategoryList() {
    return _jsonApiClient!.getCategoryList();
  }
  Future<List<CuisineModel>> getCuisineList() {
    return _jsonApiClient!.getCuisineList();
  }

  Future<List<RecipeModel>> getRecipeList() {
    return _jsonApiClient!.getRecipeList();
  }
}
