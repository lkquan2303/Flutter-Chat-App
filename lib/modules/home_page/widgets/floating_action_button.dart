import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

FloatingActionButton buildFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {},
    backgroundColor: kPrimaryColor,
    child: Icon(
      Icons.person_add_alt_1,
      color: Colors.white,
    ),
  );
}
