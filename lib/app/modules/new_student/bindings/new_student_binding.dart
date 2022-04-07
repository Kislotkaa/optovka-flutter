import 'package:get/get.dart';

import '../controllers/new_student_controller.dart';

class NewStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewStudentController>(
      () => NewStudentController(sqlLiteController: Get.find()),
    );
  }
}
