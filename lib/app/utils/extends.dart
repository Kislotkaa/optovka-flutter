import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:autoparts/app/resources/app_colors.dart';

void showSnackbar(
  String text,
  String title,
) {
  if (Get.isSnackbarOpen == false) {
    Get.rawSnackbar(
      boxShadows: [
        BoxShadow(
          offset: const Offset(0, 8),
          blurRadius: 25,
          spreadRadius: 0,
          color: Get.theme.primaryColor.withOpacity(0.12),
        )
      ],
      titleText: Text(
        title,
        style: Get.textTheme.bodyText1,
      ),
      messageText: Text(
        text,
        style: Get.textTheme.subtitle1,
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      borderRadius: 12,
      backgroundColor: AppColors.primaryAccentConst,
    );
  } else {
    Get.back();
  }
}
