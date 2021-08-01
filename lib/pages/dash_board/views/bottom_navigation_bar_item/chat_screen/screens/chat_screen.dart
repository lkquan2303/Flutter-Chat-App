import 'package:flutter/material.dart';

import '../layouts/chat_app_bar.dart';
import '../layouts/chat_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildChatAppBar(),
      body: ChatBody(),
    );
  }
}
