import 'package:flutter/material.dart';

import '../layouts/app_bar.dart';
import '../layouts/body_chat.dart';
import '../widgets/floating_action_button.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          // ignore: lines_longer_than_80_chars
          const BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chats'),
          const BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
          const BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          const BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_2.png'),
              radius: 20,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
