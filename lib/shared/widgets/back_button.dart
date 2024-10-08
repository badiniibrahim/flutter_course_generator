import 'dart:io';

import 'package:course_generator/config/app_pages.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.isGotoHome = false});
  final bool? isGotoHome;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if can go back, go back or go to home
        if (isGotoHome!) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.key.currentState?.canPop() == true
              ? Get.back()
              : Get.offAllNamed(Routes.HOME);
        }
      },
      child: Platform.isIOS
          ? const Icon(
              FluentIcons.ios_arrow_ltr_24_filled,
              color: Colors.black,
            )
          : const Icon(
              FluentIcons.arrow_left_24_regular,
              color: Colors.black,
            ),
    );
  }
}
