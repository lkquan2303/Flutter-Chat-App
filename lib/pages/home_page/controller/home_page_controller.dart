import 'package:get/get.dart';

class HomePageController extends GetxController {
  int bottomNavigationBarIndex = 0;

  // ignore: use_setters_to_change_properties
  void selectedBottomNativationBarItem(int index) {
    bottomNavigationBarIndex = index;
    update();
  }
}
