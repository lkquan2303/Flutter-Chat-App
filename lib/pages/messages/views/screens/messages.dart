import 'package:flutter/material.dart';

import '../layout/body_messages.dart';
import '../layout/message_app_bar.dart';

class MessagesScreen extends StatelessWidget {
  static String routeName = '/messages_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMessageAppBar(),
      body: const BodyMessages(),
    );
  }
}
