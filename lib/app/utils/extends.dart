import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:facult/app/resources/app_colors.dart';

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

Future<void> showDefaultDialog({
  required String title,
  required String middleText,
  required String cancelText,
  required String confirmText,
  required Function() confirmAction,
  required Function() cancelAction,
}) {
  return Get.defaultDialog(
    backgroundColor: Get.theme.backgroundColor,
    title: title,
    middleText: middleText,
    cancel: SizedBox(
      height: 35,
      child: ElevatedButton(
        child: Text(
          confirmText,
          style: Get.textTheme.bodyText2,
        ),
        onPressed: confirmAction,
      ),
    ),
    titleStyle: Get.textTheme.bodyText2,
    middleTextStyle: Get.textTheme.bodyText2,
    confirm: SizedBox(
      height: 35,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        onPressed: cancelAction,
        child: Text(
          cancelText,
          style: Get.textTheme.bodyText2,
        ),
      ),
      // ElevatedButton(
      //   isOutLine: true,
      //   child: Text(
      //     confirmText,
      //     style: Get.textTheme.bodyText2,
      //   ),
      //   onPressed: confirmAction(),
      // ),
    ),
  );
}
