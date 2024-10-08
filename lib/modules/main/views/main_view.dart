import 'package:course_generator/modules/main/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.015),
              blurRadius: 8,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            return Obx(
              () => BottomNavbarItem(
                title: controller.state.titles[index],
                isActive: controller.state.currentTab.value == index,
                icon: controller.state.icons[index],
                onTap: () => controller.updateIndex(index),
              ),
            );
          }),
        ),
      ),
      body: Obx(
          () => controller.state.screens[controller.state.currentTab.value]),
    );
  }
}
