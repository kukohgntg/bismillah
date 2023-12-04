import 'package:bismillah/app/data/provider/appwrite_provider.dart';
import 'package:bismillah/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(AuthRepository(AppWriteProvider())),
    );
  }
}
