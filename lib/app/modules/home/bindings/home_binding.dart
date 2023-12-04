import 'package:bismillah/app/data/provider/appwrite_provider.dart';
import 'package:bismillah/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(AuthRepository(AppWriteProvider())),
    );
  }
}
