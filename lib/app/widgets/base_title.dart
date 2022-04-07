import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseTitle extends StatelessWidget {
  const BaseTitle(this.title, {Key? key}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: Get.textTheme.headline2,
    );
  }
}
