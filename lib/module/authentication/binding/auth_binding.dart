import 'package:get/get.dart';

import '../controller/auth_controller.dart';


///
///Inject all the controllers here
///

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
  }
}