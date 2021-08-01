// ignore: file_names
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../dash_board/views/screens/dash_board_screen.dart';
import '../welcome/screens/welcome_screen.dart';
import 'controller/firebase_controller.dart';

class Homepage extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<FirebaseController>().userEmail != ''
          ? ChatScreen()
          : WelcomeScreen(),
    );
  }
}
