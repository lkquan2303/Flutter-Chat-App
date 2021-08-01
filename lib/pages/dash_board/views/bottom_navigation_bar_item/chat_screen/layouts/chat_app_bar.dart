import 'package:flutter/material.dart';

AppBar buildChatAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text('Chats'),
    actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
  );
}
