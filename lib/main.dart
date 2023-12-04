import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});
  final GetStorage _getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute:
          _getStorage.read("userId") != null ? Routes.HOME : Routes.LOGIN,
      // _authController.isLoggedIn.value ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
