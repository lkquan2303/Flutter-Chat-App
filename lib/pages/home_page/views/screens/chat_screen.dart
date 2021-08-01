import 'package:chat_app/pages/profile/views/layouts/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/constants.dart';
import '../../controller/home_page_controller.dart';
import '../layouts/app_bar.dart';
import '../layouts/chat_body.dart';
import '../widgets/floating_action_button.dart';

class ChatScreen extends StatelessWidget {
  static String routeName = '/chat_screen';

  // final homepageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: IndexedStack(
            index: controller.bottomNavigationBarIndex,
            children: [
              ChatBody(),
              ChatBody(),
              ChatBody(),
              ProfileBody(),
            ],
          ),
        ),
        floatingActionButton: buildFloatingActionButton(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.bottomNavigationBarIndex,
          onTap: controller.selectedBottomNativationBarItem,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            _bottomNavigationBarItem(
                icon: const Icon(Icons.message), label: 'Chats'),
            _bottomNavigationBarItem(
                icon: const Icon(Icons.people), label: 'People'),
            _bottomNavigationBarItem(
                icon: const Icon(Icons.call), label: 'Calls'),
            _bottomNavigationBarItem(
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_2.png'),
                radius: 20,
              ),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {required Widget icon, required String label}) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }
}
