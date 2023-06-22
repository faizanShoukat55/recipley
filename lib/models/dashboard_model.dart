import 'package:recipley/models/parent/model.dart';


///
///Dashboard Models
///

class CategoryModel extends Model {
  String? categoryId;
  String? categoryName;
  bool? isSelected = false;

  CategoryModel({this.categoryId, this.categoryName, this.isSelected});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = stringFromJson(json, 'categoryId');
    categoryName = stringFromJson(json, 'categoryName');
    isSelected = boolFromJson(json, 'isSelected');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['isSelected'] = isSelected;

    return data;
  }
}

class CuisineModel extends Model {
  String? cuisineId;
  String? cuisineName;
  bool? isSelected = false;

  CuisineModel({this.cuisineId, this.cuisineName, this.isSelected});

  CuisineModel.fromJson(Map<String, dynamic> json) {
    cuisineId = stringFromJson(json, 'cuisineId');
    cuisineName = stringFromJson(json, 'cuisineName');
    isSelected = boolFromJson(json, 'isSelected');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cuisineId'] = cuisineId;
    data['cuisineName'] = cuisineName;
    data['isSelected'] = isSelected;

    return data;
  }
}

class RecipeModel extends Model {
  String? foodId;
  String? name;
  String? categoryId;
  String? cuisineId;
  String? chef;
  String? foodImageUrl =
      "https://www.fastfoodmenunutrition.com/wp-content/uploads/2015/03/fast-food.jpg";

  RecipeModel(
      {this.foodId,
      this.name,
      this.categoryId,
      this.cuisineId,
      this.chef,
      this.foodImageUrl});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    foodId = stringFromJson(json, 'foodId');
    name = stringFromJson(json, 'name');
    categoryId = stringFromJson(json, 'categoryId');

    cuisineId = stringFromJson(json, 'cuisineId');
    chef = stringFromJson(json, 'chef');
    foodImageUrl = stringFromJson(json, 'foodImageUrl');
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodId'] = foodId;
    data['name'] = name;
    data['categoryId'] = categoryId;

    data['cuisineId'] = cuisineId;
    data['chef'] = chef;
    data['foodImageUrl'] = foodImageUrl;
    return data;
  }
}
