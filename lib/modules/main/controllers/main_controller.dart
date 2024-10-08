import 'package:course_generator/modules/main/state.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final MainState state = MainState();

  void updateIndex(int index) {
    state.currentTab.value = index;
  }
}
