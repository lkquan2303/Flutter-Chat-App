import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../constants/size_config.dart';
import '../../../../../authentication/controller/firebase_controller.dart';
import '../../../../controller/dash_board_controller.dart';
import '../widgets/setting_items.dart';
import '../widgets/user_avatar.dart';

class ProfileBody extends StatelessWidget {
  final dashBoardController = Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirebaseController>(builder: (controller) {
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),

              //*<----------------- User Avatar ------------------>
              const UserAvatar(),
              const SizedBox(
                height: 40,
              ),

              //*<----------------- Setting Items ------------------>
              SettingItems(
                icon: 'assets/icons/User.svg',
                settingTitle: 'My Account',
                onTapSetting: () {},
              ),
              SettingItems(
                icon: 'assets/icons/Bell.svg',
                settingTitle: 'Notification',
                onTapSetting: () {},
              ),
              SettingItems(
                icon: 'assets/icons/Settings.svg',
                settingTitle: 'Settings',
                onTapSetting: () {},
              ),
              SettingItems(
                icon: 'assets/icons/question.svg',
                settingTitle: 'Help Center',
                onTapSetting: () {},
              ),
              SettingItems(
                icon: 'assets/icons/Log_out.svg',
                settingTitle: 'Log out',
                onTapSetting: () => {
                  controller.signOut(),
                  dashBoardController.bottomNavigationBarIndex = 0
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
