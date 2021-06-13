import 'package:chat_app/modules/home_page/widgets/user_card.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/widgets/filled_outline_button.dart';
import 'package:chat_app/modules/home_page/models/Chat.dart';

class BodyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kPrimaryColor,
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding / 1.5),
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: "Recent Message ",
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              FillOutlineButton(
                press: () {},
                text: "Active ",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => UserCard(
              chat: chatsData[index],
              press: () {},
            ),
            itemCount: chatsData.length,
          ),
        ),
      ],
    );
  }
}
