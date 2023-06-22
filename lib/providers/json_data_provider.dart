import 'package:get/get.dart';

import '../main.dart';
import '../models/dashboard_model.dart';
import '../models/setting_model.dart';
import '../utils/helper.dart';

///
/// Fetching Data from Json
///

class JsonApiClient extends GetxService {
  Future<JsonApiClient> init() async {
    return this;
  }

  Future<Setting> getAppSettings() async {
    var response = await Helper.getJsonFile('config/theme.json');
    return Setting.fromJson(response);
  }

  Future<List<CategoryModel>> getCategoryList() async {
    var response = await Helper.getJsonFile('config/category.json');
    try {
      return response
          .map<CategoryModel>((obj) => CategoryModel.fromJson(obj))
          .toList();
    }catch(e){
      throw Exception("$e");
    }
  }


  Future<List<CuisineModel>> getCuisineList() async {
    var response = await Helper.getJsonFile('config/cuisine.json');
    try {
      return response
          .map<CuisineModel>((obj) => CuisineModel.fromJson(obj))
          .toList();
    }catch(e){
      throw Exception("$e");
    }
  }


  Future<List<RecipeModel>> getRecipeList() async {
    var response = await Helper.getJsonFile('config/recipe.json');
    try {
      return response
          .map<RecipeModel>((obj) => RecipeModel.fromJson(obj))
          .toList();
    }catch(e){
      throw Exception("$e");
    }
  }
}
