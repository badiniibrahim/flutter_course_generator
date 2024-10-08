import 'package:course_generator/modules/home/views/home_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainState {
  var currentTab = 0.obs;

  final titles = [
    "Home",
    "Calendar",
    "Standing",
    "Account",
  ];

  final icons = [
    FluentIcons.home_24_regular,
    FluentIcons.calendar_24_regular,
    FluentIcons.chart_multiple_24_regular,
    FluentIcons.person_24_regular
  ];

  final List<Widget> screens = [
    const HomeView(),
    Container(),
    Container(),
    Container(),
  ];
}
