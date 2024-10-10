import 'package:animate_do/animate_do.dart';
import 'package:course_generator/config/app_colors.dart';
import 'package:course_generator/config/app_text_styles.dart';
import 'package:course_generator/modules/create_course/controllers/create_course_controller.dart';
import 'package:course_generator/shared/rx_text_form_field.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class DescriptionView extends GetView<CreateCourseController> {
  const DescriptionView({super.key});

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
                          "category_desc".tr,
                          style: AppTextStyles.title.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )),
                    ),
                    FormBuilder(
                        child: Center(
                      child: Column(
                        children: [
                          Text(
                            "category_topic_desc".tr,
                            style: AppTextStyles.body,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 85,
                            child: RxTextFormField(
                              maxLines: 1,
                              name: "category_topic_title".tr,
                              autocorrect: false,
                              obscureText: false,
                              controller: controller.state.topicTextController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "category_about_desc".tr,
                            style: AppTextStyles.body,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 85,
                            child: RxTextFormField(
                              maxLines: 1,
                              name: "category_about".tr,
                              autocorrect: false,
                              obscureText: false,
                              controller: controller.state.aboutTextController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FadeInUp(
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
          ),
          /*floatingActionButton: Obx(
            () {
              bool isSelected =
                  controller.state.topicTextController.text.isNotEmpty;
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
          ),*/
        );
      },
    );
  }
}
