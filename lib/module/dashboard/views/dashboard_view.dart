import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipley/module/dashboard/controller/dashboard_controller.dart';
import 'package:recipley/module/dashboard/widgets/filter_bottom_sheet_widget.dart';
import 'package:recipley/utils/images_provider.dart';

import '../../../utils/helper.dart';
import '../../../utils/ui.dart';
import '../widgets/food_list_item.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Search",
              style: Get.textTheme.headline4,
            ),
            centerTitle: true,
            backgroundColor: Get.theme.colorScheme.background,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Get.theme.primaryColorDark),
              onPressed: () => {Get.back()},
            ),
          ),
          body: RefreshIndicator(onRefresh: () async {
            controller.refreshRecipes(showMessage: true);
          }, child: Obx(() {
            return ListView(
              primary: true,
              children: [
                // DashboardSearchBarWidget(),
                buildSearchBar(controller),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.filteredRecipeList.length,
                  itemBuilder: ((_, index) {
                    var item = controller.filteredRecipeList[index];
                    return FoodListItemWidget(
                      recipeModel: item,
                    );
                  }),
                )
              ],
            );
          })).marginSymmetric(horizontal: 20)),
    );
  }
}

Widget buildSearchBar(DashboardController controller) {
  return Hero(
    tag: Get.arguments ?? '',
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
                color: Get.theme.backgroundColor,
                border: Border.all(
                  color: Get.theme.focusColor.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 0),
                  child: Icon(Icons.search, color: Get.theme.primaryColorDark),
                ),
                Expanded(
                  child: Material(
                    // color: Get.theme.primaryColor,
                    child: TextField(
                      controller: controller.textEditingController,
                      style: Get.textTheme.bodyText2,
                      // onSubmitted: (value) {
                      //   controller.searchRecipes(keywords: value);
                      // },
                      onChanged: (value) {
                        // controller.searchRecipes(keywords: value);
                        controller.applySearchRecipes(keywords: value);
                      },
                      autofocus: false,
                      cursorColor: Get.theme.focusColor,
                      decoration: Ui.getInputDecoration(
                          hintText: "Search here..."),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              const RecipeFilterBottomSheetWidget(),
              isScrollControlled: true,
            );
          },
          child: Container(
            // padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Get.theme.primaryColor),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                Icon(
                  Icons.filter_list,
                  color: Get.theme.backgroundColor,
                  size: 21,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
