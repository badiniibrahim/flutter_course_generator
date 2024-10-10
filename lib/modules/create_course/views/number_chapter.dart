import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:course_generator/config/app_colors.dart';
import 'package:course_generator/config/app_text_styles.dart';
import 'package:course_generator/modules/create_course/controllers/create_course_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberChapter extends GetView<CreateCourseController> {
  const NumberChapter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCourseController>(
      init: CreateCourseController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.1),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FadeInRightBig(
                          child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "category_no_chapter".tr,
                          style: AppTextStyles.title.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )),
                    ),
                    SizedBox(
                      height: Get.height * .2,
                      child: Column(
                        children: [
                          Obx(() => _buildFlipCounter(controller)),
                          Obx(() => _buildButtons(
                              controller,
                              controller.state.numberOfChapter.value
                                  .toDouble())),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: Obx(
            () {
              bool isSelected = controller.state.numberOfChapter.value > 0;

              return isSelected
                  ? FadeInUp(
                      child: FloatingActionButton(
                        onPressed: () {
                          controller.goToNextPage();
                        },
                        backgroundColor: AppColors.primary,
                        child: const Icon(
                          FluentIcons.arrow_circle_right_24_regular,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }

  Widget _buildFlipCounter(CreateCourseController controller) {
    return AnimatedFlipCounter(
      prefix: controller.state.numberOfChapter.value.toInt() <= 1
          ? "category_chapter".tr
          : "category_chapters".tr,
      value: controller.state.numberOfChapter.value.toInt(),
      textStyle: AppTextStyles.body.copyWith(fontSize: 20),
    );
  }

  Widget _buildButtons(CreateCourseController controller, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCounterButton(
          label: '-1',
          onPressed: value > 0 ? () => controller.reduce(1) : null,
        ),
        const SizedBox(width: 8),
        _buildCounterButton(
          label: '+1',
          onPressed: () => controller.add(1),
        ),
      ],
    );
  }

  Widget _buildCounterButton({
    required String label,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: AppTextStyles.body.copyWith(color: Colors.white),
      ),
    );
  }
}
