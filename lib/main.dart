import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:recipley/providers/firebase_provider.dart';
import 'package:recipley/providers/json_data_provider.dart';
import 'package:recipley/routes/app_pages.dart';
import 'package:recipley/service/setting_service.dart';
import 'package:firebase_core/firebase_core.dart';

Logger logger = Logger();

Future<bool> initServices() async {
  await Firebase.initializeApp();
  await Get.putAsync(() => JsonApiClient().init());
  await Get.putAsync(() => FirebaseProvider().init());
  await Get.putAsync(() => SettingsService().init());
  Get.log("All services has been started.");
  return true;
}

void main() async {
  ///Init Services
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  ///Custom Error Widget Screen
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
        color: Get.theme.primaryColor,
        child: Center(
            child: Text(
          details.exception.toString(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        )),
      );

  runApp(const StartingWithAllSettings());
}

class StartingWithAllSettings extends StatelessWidget {
  const StartingWithAllSettings({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          onReady: () {},
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          theme: Get.find<SettingsService>().getLightTheme(),
          defaultTransition: Transition.cupertino,
        );
      },
    );
  }
}
