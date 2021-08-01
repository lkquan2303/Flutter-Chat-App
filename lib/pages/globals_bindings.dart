import 'package:get/get.dart';

import 'authentication/controller/firebase_controller.dart';
import 'dash_board/controller/home_page_controller.dart';

class GlobalsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    // ignore: cascade_invocations
    Get.put(FirebaseController());
  }
}
