import 'package:animate_do/animate_do.dart';
import 'package:course_generator/config/app_colors.dart';
import 'package:course_generator/config/app_text_styles.dart';
import 'package:course_generator/modules/create_course/controllers/create_course_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CategoryView extends GetView<CreateCourseController> {
  const CategoryView({super.key});

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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FadeInRightBig(
                          child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "category_choose_category".tr,
                          style: AppTextStyles.title.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )),
                    ),
                    Expanded(
                      child: Obx(
                        () => GridView.builder(
                          padding: const EdgeInsets.all(16.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 0.9,
                          ),
                          itemCount:
                              controller.state.selectCategoryOptions.length,
                          itemBuilder: (context, index) {
                            final category =
                                controller.state.selectCategoryOptions[index];

                            return GestureDetector(
                              onTap: () {
                                controller.selectCategory(index, category);
                              },
                              child: Obx(() => Container(
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.blueGrey.shade50
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: controller.state
                                                    .selectCategory['id'] ==
                                                index
                                            ? Colors.green
                                            : Colors.blueGrey.shade200,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.teal.shade100,
                                            radius: 60,
                                            child: SizedBox(
                                              width: 180,
                                              height: 180,
                                              child: Lottie.asset(
                                                  category['icon']),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          category['title'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: Obx(
            () {
              bool isSelected =
                  controller.state.selectCategory.containsKey('title') &&
                      controller.state.selectCategory['title'] != '';

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
}
