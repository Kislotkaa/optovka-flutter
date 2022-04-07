import 'package:get/get.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';
import 'package:optovka/app/model/client.dart';
import 'package:optovka/app/model/facult.dart';
import 'package:optovka/app/routes/app_pages.dart';

import '../../../model/client_facult.dart';
import '../../../utils/extends.dart';
import '../../add_grade_student/views/add_grade_student_view.dart';

class DetailFacultController extends GetxController {
  DetailFacultController({required this.sqlLiteController});

  final RxList<ClientFacult> list = RxList();
  final SqlLiteController sqlLiteController;

  late Rxn<Facult> facult = Rxn(null);
  final count = 0.obs;

  @override
  Future<void> onInit() async {
    facult.value = Get.arguments;
    await updateStudentFacult();
    super.onInit();
  }

  Future<void> updateStudentFacult() async {
    await Future.delayed(Duration(milliseconds: 250));
    list.value = await sqlLiteController.getUsersFacult(facult.value?.id ?? '');
  }

  Future<void> addStudent(Client student) async {
    if (facult.value != null) {
      sqlLiteController.addStudentFacult(student, facult.value!);
    }
  }

  Future<void> addStudentFacult() async {
    await Get.toNamed(Routes.ADD_STUDENT_FACULT)?.then((value) async {
      await addStudent(value);
      await updateStudentFacult();
    });
  }

  Future<void> addGrade(Client student) async {
    await showAddGradeDialog(facult.value!, student);
    updateStudentFacult();
    // await showDefaultDialog(
    //   cancelAction: () {
    //     Get.back();
    //   },
    //   cancelText: 'Отмена',
    //   confirmAction: () {
    //     Get.back();
    //     showAddGradeDialog();
    //   },
    //   confirmText: 'Уверен',
    //   middleText: 'Вы уверены что хотите поставить оценку студенту?',
    //   title: 'Поставить оценку',
    // );
  }
}
