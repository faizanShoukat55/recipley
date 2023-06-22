import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:recipley/repositories/recipe_repository.dart';

import '../../../main.dart';
import '../../../models/dashboard_model.dart';
import '../../../utils/ui.dart';

class DashboardController extends GetxController {
  RecipeRepository? _recipeRepository;
  final recipeList = <RecipeModel>[].obs;
  final filteredRecipeList = <RecipeModel>[].obs;

  ///Search bar
  TextEditingController? textEditingController;

  ///bottom sheet
  final categoryList = <CategoryModel>[].obs;
  final selectedCategoryList = <CategoryModel>[].obs;
  final cuisineList = <CuisineModel>[].obs;
  final selectedCuisineList = <CuisineModel>[].obs;

  DashboardController() {
    _recipeRepository = RecipeRepository();
  }

  @override
  void onInit() async {
    super.onInit();
    await getCategories();
    await getCuisines();
    await getRecipes();
  }

  Future refreshRecipes({bool? showMessage}) async {
    await getRecipes();
    if (showMessage == true) {
      Get.showSnackbar(Ui.successSnackBar(
          message: "List of faqs refreshed successfully".tr));
    }
  }

  Future getCategories() async {
    try {
      categoryList.assignAll(await _recipeRepository!.getCategoryList());
    } catch (e) {
      logger.e("Exception :$e");
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getCuisines() async {
    try {
      cuisineList.assignAll(await _recipeRepository!.getCuisineList());
    } catch (e) {
      logger.e("Exception :$e");
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getRecipes() async {
    try {
      recipeList.assignAll(await _recipeRepository!.getRecipeList());
      filteredRecipeList.value = recipeList;
    } catch (e) {
      logger.e("Exception :$e");
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  ///update Category list
  Future updateCategoryHashTagChipColor(int position, bool isSelected) async {
    categoryList[position].isSelected = isSelected;

    selectedCategoryList.clear();
    categoryList.asMap().forEach((index, value) {
      if (value.isSelected != null && value.isSelected == true) {
        selectedCategoryList.add(value);
      }
    });
    categoryList.refresh();
  }

  ///update Cuisine list
  Future updateCuisineHashTagChipColor(int position, bool isSelected) async {
    cuisineList[position].isSelected = isSelected;

    selectedCuisineList.clear();
    cuisineList.asMap().forEach((index, value) {
      if (value.isSelected != null && value.isSelected == true) {
        selectedCuisineList.add(value);
      }
    });
    cuisineList.refresh();
  }

  ///Search recipes
  Future searchRecipes({required String keywords}) async {
    try {
      if (keywords.isEmpty) {
        filteredRecipeList.value = recipeList;
      } else {
        List<RecipeModel>? filteredList = <RecipeModel>[];
        for (var element in recipeList) {
          bool isContain =
              element.name?.toLowerCase().contains(keywords.toLowerCase()) ??
                  false;
          if (isContain) {
            filteredList.add(element);
          }

          filteredRecipeList.value = filteredList;
        }
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future applySearchRecipes({required String keywords}) async {
    try {
      if (keywords.isEmpty) {
        logger.e("FilterIssue  keyword empty");
        filteredRecipeList.value = recipeList;

        List<RecipeModel>? filteredListWithCategoryAndCuisine = [];
        for (var item in filteredRecipeList.value) {
          ///filter complete list on the basis CategoryId and cuisineId

          CategoryModel isCategory = selectedCategoryList.firstWhere(
              (element) => item.categoryId == element.categoryId,
              orElse: () => CategoryModel());
          CuisineModel isCuisine = selectedCuisineList.firstWhere(
              (element) => item.cuisineId == element.cuisineId,
              orElse: () => CuisineModel());

          if (selectedCategoryList.isNotEmpty &&
              selectedCuisineList.isNotEmpty) {
            if (isCategory.categoryId != null && isCuisine.cuisineId != null) {
              filteredListWithCategoryAndCuisine.add(item);
            }
          } else if (selectedCategoryList.isNotEmpty) {
            if (isCategory.categoryId != null) {
              filteredListWithCategoryAndCuisine.add(item);
            }
          } else if (selectedCuisineList.isNotEmpty) {
            if (isCuisine.cuisineId != null) {
              filteredListWithCategoryAndCuisine.add(item);
            }
          }else if (selectedCategoryList.isEmpty &&
              selectedCuisineList.isEmpty) {
            filteredListWithCategoryAndCuisine.add(item);
          }
        }

        filteredRecipeList.value = filteredListWithCategoryAndCuisine;
      } else {
        logger.e("FilterIssue  else case");

        ///filter complete list on the basis of keyword
        List<RecipeModel>? filteredListWithKeyword = [];
        filteredListWithKeyword = filteredRecipeList
            .where((element) =>
                element.name!.toLowerCase().contains(keywords.toLowerCase()))
            .toList();

        logger.e(
            "FilterIssue  filteredListWithKeyword :${filteredListWithKeyword.length}");

        List<RecipeModel>? filteredListWithCategoryAndCuisine = [];
        for (var item in filteredListWithKeyword) {
          ///filter complete list on the basis CategoryId and cuisineId

          CategoryModel isCategory = selectedCategoryList.firstWhere(
              (element) => item.categoryId == element.categoryId,
              orElse: () => CategoryModel());
          CuisineModel isCuisine = selectedCuisineList.firstWhere(
              (element) => item.cuisineId == element.cuisineId,
              orElse: () => CuisineModel());

          if (selectedCategoryList.isNotEmpty &&
              selectedCuisineList.isNotEmpty) {
            if (isCategory.categoryId != null && isCuisine.cuisineId != null) {
              filteredListWithCategoryAndCuisine.add(item);
            }
          } else if (selectedCategoryList.isNotEmpty) {
            if (isCategory.categoryId != null) {
              filteredListWithCategoryAndCuisine.add(item);
            }
          } else if (selectedCuisineList.isNotEmpty) {
            if (isCuisine.cuisineId != null) {
              filteredListWithCategoryAndCuisine.add(item);
            }
          }else if (selectedCategoryList.isEmpty &&
              selectedCuisineList.isEmpty) {
            filteredListWithCategoryAndCuisine.add(item);
          }
        }

        filteredRecipeList.value = filteredListWithCategoryAndCuisine;
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  ///clear filter
  Future clearFilter() async {
    selectedCategoryList.clear();
    categoryList.forEach((element) {
      element.isSelected = false;
    });

    selectedCuisineList.clear();
    cuisineList.forEach((element) {
      element.isSelected = false;
    });

    textEditingController?.clear();

    refreshRecipes(showMessage: false);
  }
}
