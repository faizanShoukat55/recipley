import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/dashboard_model.dart';
import '../../../utils/images_provider.dart';
import '../../../utils/ui.dart';

class FoodListItemWidget extends StatelessWidget {
  final RecipeModel recipeModel;
  FoodListItemWidget({
    Key? key,
    required this.recipeModel
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: 0.009 * size.height),
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 0, top: 10, bottom: 10),
        decoration: Ui.getBoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: recipeModel.foodImageUrl!=null
                  ? CachedNetworkImage(
                height: 60,
                width: 80,
                fit: BoxFit.cover,
                imageUrl: recipeModel.foodImageUrl??"",
                placeholder: (context, url) => Image.asset(
                  ImagesPath.loadingGif,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 80,
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
              )
                  : Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                      width: 1,
                    )),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            recipeModel.name??"",
                            style: Get.textTheme.bodyText2,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            // textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.02 * size.width,
                      ),
                      Container(
                        decoration: Ui.getBoxDecoration(
                            radius: 5, color: Get.theme.primaryColorDark),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Get.theme.scaffoldBackgroundColor,
                            size: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.04 * size.width,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),


                  Row(
                    children: [

                      ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child:CachedNetworkImage(
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                            imageUrl: recipeModel.foodImageUrl??"",
                            placeholder: (context, url) => Image.asset(
                              ImagesPath.loadingGif,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 20,
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error_outline),
                          )
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          recipeModel.chef??"",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Get.textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}