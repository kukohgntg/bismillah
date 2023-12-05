// ignore_for_file: unnecessary_overrides

import 'package:appwrite/appwrite.dart';
import 'package:bismillah/app/data/models/employee_model.dart';
import 'package:bismillah/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/custom_snack_bar.dart';
import '../../../utils/full_screen_dialog_loader.dart';

class HomeController extends GetxController with StateMixin<List<Employee>> {
  AuthRepository authRepository;
  HomeController(this.authRepository);

  final GetStorage _getStorage = GetStorage();
  late List<Employee> employeeList = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // super.onReady();
    getEmployee();
  }

  @override
  void onClose() {
    super.onClose();
  }

  logout() async {
    try {
      FullScreenDialogLoader.showDialog();
      await authRepository.logout(_getStorage.read("sessionId")).then((value) {
        FullScreenDialogLoader.cancelDialog();
        _getStorage.erase();
        Get.offAllNamed(Routes.LOGIN);
      }).catchError((error) {
        FullScreenDialogLoader.cancelDialog();
        if (error is AppwriteException) {
          CustomSnackBar.showErrorSnackBar(
              context: Get.context,
              title: "Error",
              message: error.response['message']);
        } else {
          CustomSnackBar.showErrorSnackBar(
              context: Get.context,
              title: "Error",
              message: "Shomething went wrong");
        }
      });
    } catch (e) {
      FullScreenDialogLoader.cancelDialog();
      CustomSnackBar.showErrorSnackBar(
          context: Get.context,
          title: "Error",
          message: "Shomething went wrong");
    }
  }

  moveToCreateEmpoyee() {
    Get.toNamed(Routes.CREATE_EMPOYEE);
  }

  moveToEditEmpoyee(Employee employee) {
    Get.toNamed(Routes.CREATE_EMPOYEE, arguments: employee);
  }

  deleteEmployee(Employee employee) async {
    try {
      FullScreenDialogLoader.showDialog();
      await authRepository.deleteEmployee({
        "documentId": employee.documentId,
      }).then((value) async {
        await authRepository.deleteEmployeeImage(employee.image);
        FullScreenDialogLoader.cancelDialog();
        CustomSnackBar.showSuccessSnackBar(
            context: Get.context,
            title: "Success",
            message: "Employee Deleted");
        Get.offAllNamed(Routes.HOME);
      }).catchError((error) async {
        FullScreenDialogLoader.cancelDialog();
        if (error is AppwriteException) {
          CustomSnackBar.showErrorSnackBar(
              context: Get.context,
              title: "Error",
              message: error.response['message']);
        } else {
          CustomSnackBar.showErrorSnackBar(
              context: Get.context,
              title: "Error",
              message: "Something went wrong");
        }
      });
    } catch (e) {
      FullScreenDialogLoader.cancelDialog();
      CustomSnackBar.showErrorSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong");
    }
  }

  getEmployee() async {
    try {
      change(null, status: RxStatus.loading());
      await authRepository.getEmployees().then((value) {
        Map<String, dynamic> data = value.toMap();
        List d = data['documents'].toList();
        employeeList = d
            .map(
              (e) => Employee.fromMap(e['data']),
            )
            .toList();
        change(employeeList, status: RxStatus.success());
      }).catchError((error) {
        if (error is AppwriteException) {
          change(null, status: RxStatus.error(error.response['message']));
        } else {
          change(null, status: RxStatus.error("Something went wrong"));
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error("Something went wrong"));
    }
  }
}
