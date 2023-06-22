import 'package:get/get.dart';
import 'package:recipley/module/authentication/binding/auth_binding.dart';
import 'package:recipley/module/authentication/views/login_view.dart';
import 'package:recipley/module/dashboard/views/dashboard_view.dart';

import '../module/dashboard/binding/dashboard_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(name: Routes.login, page: () => const LoginView(), binding: AuthBinding()),

    GetPage(name: Routes.dashboard, page: () => const DashboardView(), binding: DashboardBinding())
  ];
}
