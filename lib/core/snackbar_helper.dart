import 'package:course_generator/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static error({
    required String message,
    String? title,
    double? width,
    SnackPosition? snackPosition,
    EdgeInsets? margin,
  }) {
    Get.rawSnackbar(
      title: title,
      message: message,
      maxWidth: width,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      margin: margin ?? const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.error, color: Colors.white),
      isDismissible: true,
      backgroundColor: Get.theme.colorScheme.error,
    );
  }

  static success({
    required String message,
    String? title,
    double? width,
    SnackPosition? snackPosition,
    EdgeInsets? margin,
    Color backgroundColor = AppColors.blueGrey2,
  }) {
    return Get.rawSnackbar(
      title: title,
      message: message,
      maxWidth: width,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      margin: margin ?? const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.check_circle_rounded, color: Colors.white),
      isDismissible: false,
      backgroundColor: backgroundColor,
      animationDuration: const Duration(milliseconds: 500),
      // backgroundColor: Get.theme.primaryColor,
    );
  }

  static errorSnackBarTopRight({required String message, String? title}) {
    error(
      title: title,
      message: message,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.only(top: 25, left: Get.width * .50),
    );
  }

  static errorSnackBarTopCenter({required String message, String? title}) {
    error(
      title: title,
      message: message,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    );
  }

  static successSnackBarBottomCenter({required String message, String? title}) {
    success(
      title: title,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 20),
    );
  }

  static successSnackBarTopRight({required String message, String? title}) {
    success(
      title: title,
      message: message,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.only(top: 0, left: Get.width * .4),
    );
  }

  static successSnackBarTopCenter({
    required String message,
    String? title,
    Color backgroundColor = AppColors.blueGrey2,
  }) {
    success(
      title: title,
      message: message,
      width: Get.width,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      backgroundColor: AppColors.primary,
    );
  }
}
