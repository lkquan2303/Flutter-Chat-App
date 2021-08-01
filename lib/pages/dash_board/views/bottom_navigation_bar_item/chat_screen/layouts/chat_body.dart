import 'package:flutter/material.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../widgets/filled_outline_button.dart';
import '../../../../../messages/views/screens/messages.dart';
import '../../../../models/Chat.dart';
import '../widgets/user_card.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kPrimaryColor,
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding / 1.5),
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: 'Recent Message ',
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              FillOutlineButton(
                press: () {},
                text: 'Active ',
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => UserCard(
              chat: chatsData[index],
              press: () =>
                  Navigator.pushNamed(context, MessagesScreen.routeName),
            ),
            itemCount: chatsData.length,
          ),
        ),
      ],
    );
  }
}
