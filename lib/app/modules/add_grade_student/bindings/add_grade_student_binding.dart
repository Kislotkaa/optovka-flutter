import 'package:get/get.dart';

import '../controllers/add_grade_student_controller.dart';

class AddGradeStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddGradeStudentController>(
      () => AddGradeStudentController(
          sqlLiteController: Get.find(), facult: null, student: null),
    );
  }
}
