import 'package:course_generator/core/data/local/constants.dart';
import 'package:course_generator/modules/create_course/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCourseController extends GetxController {
  final CreateCourseState state = CreateCourseState();

  final List<int> _pageList = List.generate(8, (i) => i);
  bool get isLastPage => state.currentIndexPage.value == _pageList.length - 1;

  @override
  void onInit() {
    super.onInit();
    state.selectCategoryOptions = categoryOptions;
    state.selectLevelOptions = levelOptions;
    state.currentIndexPage.value = 0;
    state.pageController.addListener(() {
      if (state.pageController.page?.toInt() != state.currentIndexPage.value) {
        state.currentIndexPage.value = state.pageController.page?.toInt() ?? 0;
      }
    });
  }

  void resetNavigation() {
    state.currentIndexPage.value = 0;
  }

  void goToNextPage() {
    if (!isLastPage) {
      state.pageController
          .nextPage(duration: 500.milliseconds, curve: Curves.ease);
    }
  }

  void goToPreviousPage() {
    if (state.currentIndexPage.value > 0) {
      state.currentIndexPage.value--;
      state.pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Get.back();
    }
  }

  @override
  void onClose() {
    state.pageController.dispose();
    super.onClose();
  }

  void selectCategory(int id, Map<String, dynamic> value) {
    state.selectCategory = value;
  }

  void selectLevel(int id, Map<String, dynamic> value) {
    state.selectLevel = value;
  }

  void add(double increment) {
    state.numberOfChapter.value += increment.toInt();
  }

  void reduce(double decrement) {
    if (state.numberOfChapter.value - decrement >= 0) {
      state.numberOfChapter.value -= decrement.toInt();
    }
  }

  void setDuration(int duration) {
    state.duration.value = duration;
  }

  void setLevel(int level) {
    state.level.value = level;
  }
}
