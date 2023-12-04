import 'package:bismillah/app/data/provider/appwrite_provider.dart';
import 'package:bismillah/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../controllers/create_empoyee_controller.dart';

class CreateEmpoyeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateEmpoyeeController>(
      () => CreateEmpoyeeController(AuthRepository(AppWriteProvider())),
    );
  }
}
