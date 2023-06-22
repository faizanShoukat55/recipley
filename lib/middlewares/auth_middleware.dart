import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';


///Its middleware currently the app required login and then the rest of the flow
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // final authService = Get.find<AuthService>();
    // if (!authService.isAuth) {
    //   return RouteSettings(name: Routes.LOGIN);
    // }
    return null;
  }
}
