import 'package:get/get.dart';

import '../../../data/provider/appwrite_provider.dart';
import '../../../data/repository/auth_repository.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(AuthRepository(AppWriteProvider())),
    );
  }
}
