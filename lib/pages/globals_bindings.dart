import 'package:get/get.dart';

import 'authentication/controller/firebase_controller.dart';
import 'dash_board/controller/dash_board_controller.dart';

class GlobalsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController());
    // ignore: cascade_invocations
    Get.put(FirebaseController());
  }
}
