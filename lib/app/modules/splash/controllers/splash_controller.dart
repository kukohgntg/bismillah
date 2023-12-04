// ignore_for_file: unnecessary_overrides

import 'package:bismillah/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final GetStorage _getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  //TODO:https://youtu.be/k_CvQl_IDl8?si=J0XlD6HdaESfkx84&t=322
  //TODO:https://youtu.be/afEY74qIiGk?si=aRMHbwMenXaNT3-t&t=200
  @override
  void onReady() {
    super.onReady();
    // Future.delayed(
    //     const Duration(seconds: 3), () => Get.offAllNamed(Routes.LOGIN));
    if (_getStorage.read("userId") != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
