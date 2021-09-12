import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class CustomFullScreenDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () => Future.value(false),
        child: const SpinKitHourGlass(
          color: kPrimaryColor,
          size: 50,
        ),
      ),
      barrierDismissible: false,
      // barrierColor: Color(0xff141A31).withOpacity(.3),
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
