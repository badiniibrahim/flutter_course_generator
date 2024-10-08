import 'package:easy_stepper/easy_stepper.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_course_controller.dart';

class CreateCourseView extends GetView<CreateCourseController> {
  const CreateCourseView({super.key});
  @override
  Widget build(BuildContext context) {
    var activeStep = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateCourseView'),
        centerTitle: true,
      ),
      body: Center(
        child: EasyStepper(
          activeStep: activeStep,
          stepShape: StepShape.rRectangle,
          stepBorderRadius: 15,
          borderThickness: 2,
          stepRadius: 28,
          finishedStepBorderColor: Colors.deepOrange,
          finishedStepTextColor: Colors.deepOrange,
          finishedStepBackgroundColor: Colors.deepOrange,
          activeStepIconColor: Colors.deepOrange,
          showLoadingAnimation: false,
          steps: [
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 0 ? 1 : 0.3,
                  child: const Icon(FluentIcons.home_24_regular),
                ),
              ),
              customTitle: const Text(
                'Dash 1',
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 1 ? 1 : 0.3,
                  child: const Icon(FluentIcons.home_24_regular),
                ),
              ),
              customTitle: const Text(
                'Dash 2',
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 2 ? 1 : 0.3,
                  child: const Icon(FluentIcons.home_24_regular),
                ),
              ),
              customTitle: const Text(
                'Dash 3',
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 3 ? 1 : 0.3,
                  child: const Icon(FluentIcons.home_24_regular),
                ),
              ),
              customTitle: const Text(
                'Dash 4',
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 4 ? 1 : 0.3,
                  child: const Icon(FluentIcons.home_24_regular),
                ),
              ),
            ),
          ],
          onStepReached: (index) => {},
        ),
      ),
    );
  }
}
