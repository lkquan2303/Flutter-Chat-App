import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/constants/size_config.dart';
import 'package:flutter/material.dart';

AppBar buildMessageAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        BackButton(),
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/user_2.png"),
        ),
        SizedBox(
          width: kDefaultPadding * 0.75,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Le Quan",
              style: TextStyle(fontSize: getProportionateScreenHeight(20)),
            ),
            Text(
              "Active 2m ago",
              style: TextStyle(
                fontSize: getProportionateScreenHeight(12),
              ),
            )
          ],
        )
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.local_phone,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.videocam,
        ),
      ),
      SizedBox(
        width: kDefaultPadding / 2,
      )
    ],
  );
}
