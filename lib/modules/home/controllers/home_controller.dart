import 'package:course_generator/modules/create_course/views/create_course_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentTab = 0.obs;

  final titles = [
    "Home",
    "Explore",
    "Upgrade",
    "Account",
  ];

  final icons = [
    FluentIcons.home_24_regular,
    FluentIcons.calendar_24_regular,
    FluentIcons.chart_multiple_24_regular,
    FluentIcons.person_24_regular
  ];

  final List<Widget> screens = [
    const CreateCourseView(),
    Container(),
    Container(),
    Container(),
  ];

  void updateIndex(int index) {
    currentTab.value = index;
  }
}
