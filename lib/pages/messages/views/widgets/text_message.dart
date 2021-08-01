import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../models/ChatMessage.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.chatMessages,
  }) : super(key: key);

  final ChatMessage chatMessages;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
        horizontal: kDefaultPadding * 0.75,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(chatMessages.isSender ? 0.9 : 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        chatMessages.text,
        style: TextStyle(
            color: chatMessages.isSender
                ? Colors.white
                : Theme.of(context).textTheme.bodyText1!.color),
      ),
    );
  }
}
