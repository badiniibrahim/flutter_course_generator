import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCourseState {
  final RxInt _currentIndexPage = 0.obs;
  RxInt get currentIndexPage => _currentIndexPage;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final RxList<Map<String, dynamic>> _selectCategoryOptions =
      <Map<String, dynamic>>[].obs;
  set selectCategoryOptions(value) => _selectCategoryOptions.value = value;
  List<Map<String, dynamic>> get selectCategoryOptions =>
      _selectCategoryOptions;

  final RxList<Map<String, dynamic>> _selectLevelOptions =
      <Map<String, dynamic>>[].obs;
  set selectLevelOptions(value) => _selectLevelOptions.value = value;
  List<Map<String, dynamic>> get selectLevelOptions => _selectLevelOptions;

  final RxInt _selectedCategoryIndex = RxInt(6);
  set selectedCategoryIndex(value) => _selectedCategoryIndex.value = value;
  int get selectedCategoryIndex => _selectedCategoryIndex.value;

  final RxMap<String, dynamic> _selectCategory = <String, dynamic>{}.obs;
  set selectCategory(value) => _selectCategory.value = value;
  Map get selectCategory => _selectCategory;

  final RxMap<String, dynamic> _selectLevel = <String, dynamic>{}.obs;
  set selectLevel(value) => _selectLevel.value = value;
  Map get selectLevel => _selectLevel;

  final Rx<TextEditingController> _topicTextController =
      TextEditingController().obs;
  TextEditingController get topicTextController => _topicTextController.value;

  final Rx<TextEditingController> _aboutTextController =
      TextEditingController().obs;
  TextEditingController get aboutTextController => _aboutTextController.value;

  final RxInt _numberOfChapter = 3.obs;
  RxInt get numberOfChapter => _numberOfChapter;

  final RxInt _duration = 1.obs;
  RxInt get duration => _duration;

  final RxInt _level = 1.obs;
  RxInt get level => _level;
}
