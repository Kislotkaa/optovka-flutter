import 'package:get/get.dart';

import '../modules/add_grade_student/bindings/add_grade_student_binding.dart';
import '../modules/add_grade_student/views/add_grade_student_view.dart';
import '../modules/add_student_facult/bindings/add_student_facult_binding.dart';
import '../modules/add_student_facult/views/add_student_facult_view.dart';
import '../modules/detail_facult/bindings/detail_facult_binding.dart';
import '../modules/detail_facult/views/detail_facult_view.dart';
import '../modules/detail_student/bindings/detail_student_binding.dart';
import '../modules/detail_student/views/detail_student_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/new_student/bindings/new_student_binding.dart';
import '../modules/new_student/views/new_student_view.dart';
import '../modules/students/bindings/students_binding.dart';
import '../modules/students/views/students_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.STUDENTS,
      page: () => StudentsView(),
      binding: StudentsBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_STUDENT,
      page: () => DetailStudentView(),
      binding: DetailStudentBinding(),
    ),
    GetPage(
      name: _Paths.NEW_STUDENT,
      page: () => NewStudentView(),
      binding: NewStudentBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_FACULT,
      page: () => DetailFacultView(),
      binding: DetailFacultBinding(),
    ),
    GetPage(
      name: _Paths.ADD_STUDENT_FACULT,
      page: () => AddStudentFacultView(),
      binding: AddStudentFacultBinding(),
    ),
    GetPage(
      name: _Paths.ADD_GRADE_STUDENT,
      page: () => AddGradeStudentView(),
      binding: AddGradeStudentBinding(),
    ),
  ];
}
