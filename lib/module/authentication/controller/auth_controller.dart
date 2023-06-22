import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:recipley/models/auth_model.dart';

import '../../../main.dart';
import '../../../providers/firebase_provider.dart';

import '../../../utils/ui.dart';

class AuthController extends GetxController {
  FirebaseProvider? _firebaseProvider;

  ///Login View Parameters
  GlobalKey<FormState>? loginFormKey;
  var user = AuthenticationModel().obs;

  // final loading = false.obs;
  final hidePassword = true.obs;

  Future login() async {
    try {
      EasyLoading.show();
      Get.focusScope?.unfocus();
      if (loginFormKey!.currentState!.validate()) {
        loginFormKey!.currentState!.save();
        _firebaseProvider = Get.find<FirebaseProvider>();
        // loading.value = true;
        _firebaseProvider!.loginWithEmailPassword(
            email: user.value.email, password: user.value.password);
      }
    } catch (e) {
      logger.e("Exception :$e");
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      // loading.value = false;
      EasyLoading.dismiss();
    }
  }
}
