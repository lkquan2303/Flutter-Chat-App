import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text("Chats"),
    actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
  );
}
