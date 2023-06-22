import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:recipley/module/dashboard/controller/dashboard_controller.dart';

import '../../../main.dart';
import '../../../utils/global_widgets/block_button_widget.dart';

class RecipeFilterBottomSheetWidget extends GetView<DashboardController> {
  const RecipeFilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.55,
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.4),
              blurRadius: 30,
              offset: const Offset(0, -30)),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SizedBox(
              //height: 50,
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ///Category view
                    Text("Category", style: Get.textTheme.headline5),
                    MasonryGridView.count(
                      primary: false,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      itemCount: controller.categoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChoiceChip(
                          selectedColor: Get.theme.primaryColor,
                          padding: const EdgeInsets.all(7),
                          label: Text(
                              controller.categoryList[index].categoryName ??
                                  ""),
                          selected: controller.categoryList[index].isSelected ??
                              false,
                          onSelected: (value) async {
                            logger.d("OnSelected :$value");
                            controller.updateCategoryHashTagChipColor(
                                index, value);
                          },
                        );
                      },
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ///Cuisine View
                    Text("Cuisine", style: Get.textTheme.headline5),
                    MasonryGridView.count(
                      primary: false,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      itemCount: controller.cuisineList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChoiceChip(
                          selectedColor: Get.theme.primaryColor,
                          padding: const EdgeInsets.all(7),
                          label: Text(
                              controller.cuisineList[index].cuisineName ?? ""),
                          selected:
                              controller.cuisineList[index].isSelected ?? false,
                          onSelected: (value) async {
                            logger.d("OnSelected :$value");
                            controller.updateCuisineHashTagChipColor(
                                index, value);
                          },
                        );
                      },
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                    ),

                    BlockButtonWidget(
                      onPressed: () async {

                        logger.e("FilterIssue  apply search");
                        await controller.applySearchRecipes(keywords:  controller.textEditingController?.text ??"");

                        Get.back();
                      },
                      color: Get.theme.primaryColor,
                      text: Text(
                        "Apply Filter",
                        style: Get.textTheme.headline6?.merge(
                            TextStyle(color: Get.theme.backgroundColor)),
                      ),
                    ).paddingOnly(top: 20, bottom: 5),


                    MaterialButton(
                      onPressed: () {
                        controller.clearFilter();
                        Get.back();

                      },
                      child: Text("Clear Filter",
                          style: Get.textTheme.headline6
                              ?.copyWith(color: Get.theme.primaryColor)),
                    ),
                  ],
                ).marginSymmetric(horizontal: 20);
              }),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
            child: Text("Filter", style: Get.textTheme.headline3),
          ),
          Container(
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: 13, horizontal: (Get.width / 2) - 30),
            decoration: BoxDecoration(
              color: Get.theme.focusColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(3),
              ),
              //child: SizedBox(height: 1,),
            ),
          ),
        ],
      ),
    );
  }
}
