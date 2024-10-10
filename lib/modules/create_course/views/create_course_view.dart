import 'package:course_generator/config/app_colors.dart';
import 'package:course_generator/config/app_text_styles.dart';
import 'package:course_generator/modules/create_course/views/category_view.dart';
import 'package:course_generator/modules/create_course/views/description_view.dart';
import 'package:course_generator/modules/create_course/views/level_view.dart';
import 'package:course_generator/modules/create_course/views/number_chapter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import 'package:get/get.dart';

import '../controllers/create_course_controller.dart';

class CreateCourseView extends GetView<CreateCourseController> {
  const CreateCourseView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCourseController>(
      init: CreateCourseController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.2),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white.withOpacity(0.2),
            title: _buildProgressBar(context),
            automaticallyImplyLeading: false,
            leading: _buildLeadingIcon(context),
            leadingWidth: MediaQuery.of(context).size.width * .3,
          ),
          body: SafeArea(
            bottom: false,
            child: _buildPageView(),
          ),
        );
      },
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .3,
      child: Obx(
        () => FAProgressBar(
          currentValue:
              (controller.state.currentIndexPage.value + 1) * 100 / 4.0,
          size: 8,
          backgroundColor: AppColors.primary.withOpacity(.3),
          progressColor: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildLeadingIcon(BuildContext context) {
    return Obx(
      () {
        bool showLeadingIcon = controller.state.currentIndexPage.value > 0 &&
            controller.state.currentIndexPage.value < 4;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showLeadingIcon)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    controller.goToPreviousPage();
                  },
                  child: const Icon(FluentIcons.arrow_left_24_regular),
                ),
              ),
            _buildPageTitle(context),
          ],
        );
      },
    );
  }

  Widget _buildPageTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
      child: Center(
        child: Obx(() {
          return Text(
            "${"category_text_step_text".tr.toUpperCase()} ${controller.state.currentIndexPage.value + 1}",
            style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
          );
        }),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      padEnds: false,
      controller: controller.state.pageController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        controller.state.currentIndexPage.value = index;
      },
      children: const [
        CategoryView(),
        DescriptionView(),
        LevelView(),
        NumberChapter()
      ],
    );
  }
}
