import 'package:chat_app/modules/home_page/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/modules/home_page/layouts/app_bar.dart';
import 'package:chat_app/modules/home_page/layouts/body_chat.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = '/chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyChat(),
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomNavigationBar(_selectedIndex),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(
    int selectedIndex,
  ) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        press();
        // setState(() {
        //   _selectedIndex = index;
        // });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
            radius: 20,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
