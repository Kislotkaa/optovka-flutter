import 'package:get/get.dart';

import '../controllers/add_student_facult_controller.dart';

class AddStudentFacultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddStudentFacultController>(
      () => AddStudentFacultController(sqlLiteController: Get.find()),
    );
  }
}
