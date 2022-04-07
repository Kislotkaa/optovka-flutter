import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_student_controller.dart';

class DetailStudentView extends GetView<DetailStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailStudentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailStudentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
