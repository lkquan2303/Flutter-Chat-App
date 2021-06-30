import 'package:chat_app/modules/messages/layout/app_bar.dart';
import 'package:chat_app/modules/messages/layout/body_messages.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  static String routeName = '/messages_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyMessages(),
    );
  }
}
