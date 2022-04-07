import 'package:get/get.dart';
import 'package:facult/app/controllers/sqllite_controller.dart';
import 'package:facult/app/model/client.dart';
import 'package:facult/app/model/facult.dart';

class AddGradeStudentController extends GetxController {
  AddGradeStudentController({
    required this.sqlLiteController,
    required this.facult,
    required this.student,
  });

  final SqlLiteController sqlLiteController;
  final Facult? facult;
  final Client? student;

  Future<void> addGrade(int count) async {
    await sqlLiteController.addGradeStudent(count, facult!.id, student!.id);
    Get.back();
  }
}
