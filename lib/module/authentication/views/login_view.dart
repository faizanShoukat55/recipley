import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipley/utils/images_provider.dart';

import '../../../utils/global_widgets/block_button_widget.dart';
import '../../../utils/global_widgets/circular_loading_widget.dart';
import '../../../utils/global_widgets/text_field_widget.dart';
import '../../../utils/helper.dart';
import '../../../utils/ui.dart';
import '../controller/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loginFormKey = GlobalKey<FormState>();
    return WillPopScope(
        onWillPop: Helper().onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Login",
              style: Get.textTheme.headline4,
            ),
            centerTitle: true,
            backgroundColor: Get.theme.colorScheme.background,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Get.theme.primaryColorDark),
              onPressed: () => {
                // Get.find<RootController>().changePageOutRoot(0)
              },
            ),
          ),
          bottomNavigationBar: buildSocialButtonWidget(),
          body: Form(
            key: controller.loginFormKey,
            child: ListView(
              primary: true,
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  onSaved: (input) => controller.user.value.email = input,
                  onChanged: (input) =>
                  controller.user.value.email = input,
                  isFirst: true,
                  labelText: "Email Address",
                  hintText: "johndoe@gmail.com",
                  validator: (input) => !input!.contains('@')
                      ? "Should be a valid email"
                      : null,
                  iconData: Icons.email_outlined,
                ),
                Obx(() {
                  return TextFieldWidget(
                    onSaved: (input) =>
                    controller.user.value.password = input,
                    onChanged: (input) =>
                    controller.user.value.password = input,
                    labelText: "Password",
                    hintText: "••••••••••••",
                    validator: (input) => input!.length < 2
                        ? "Should be more than 2 characters"
                        : null,
                    obscureText: controller.hidePassword.value,
                    iconData: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    isLast: false,
                    //for bottom padding
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidePassword.value =
                        !controller.hidePassword.value;
                      },
                      color: Get.theme.primaryColorDark,
                      icon: Icon(
                        controller.hidePassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 22,
                      ),
                    ),
                  );
                }),
                BlockButtonWidget(
                  onPressed: () async {
                    // await Get.offAndToNamed(Routes.dashBoard);
                    controller.login();
                  },
                  color: Get.theme.primaryColorDark,
                  text: Text(
                    "Login",
                    style: Get.textTheme.headline6?.merge(
                        TextStyle(color: Get.theme.backgroundColor)),
                  ),
                ).paddingSymmetric(vertical: 20, horizontal: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: Get.textTheme.headline6,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Wrap(
                        children: [
                          Text("You don't have an account? ",
                              style: Get.theme.textTheme.titleMedium
                                  ?.copyWith(
                                fontSize: 15,
                              )),
                          Text("SignUp",
                              style: Get.theme.textTheme.titleMedium
                                  ?.copyWith(
                                fontSize: 15,
                              ))
                        ],
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 2),
              ],
            )
              ],
            ),
          ),
        ));
  }

  Widget buildSocialButtonWidget() {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("or continue with",
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.titleMedium),
          const SizedBox(
            height: 5,
          ),

          ///Google Authentication
          BlockButtonWidget(
            text: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesPath.googleIcon,
                  width: 22,
                  height: 22,
                  color: Get.theme.backgroundColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Login with google",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headline6
                      ?.merge(TextStyle(color: Get.theme.backgroundColor)),
                ),
              ],
            ),
            color: Get.theme.errorColor,
            onPressed: () async {},
          ),

          const SizedBox(
            height: 8,
          ),

          ///Facebook Authentication
          BlockButtonWidget(
            text: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesPath.facebookIcon,
                  width: 22,
                  height: 22,
                  color: Get.theme.backgroundColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Login with facebook",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headline6
                      ?.merge(TextStyle(color: Get.theme.backgroundColor)),
                ),
              ],
            ),
            color: Colors.blue,
            onPressed: () async {},
          )
        ],
      ),
    ).paddingOnly(right: 20, left: 20);
  }
}
