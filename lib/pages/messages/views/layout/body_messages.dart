import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/size_config.dart';
import '../../models/ChatMessage.dart';
import '../widgets/chat_input_field.dart';
import '../widgets/text_message.dart';

class BodyMessages extends StatelessWidget {
  const BodyMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 1.5),
            child: ListView.builder(
              itemCount: demoChatMessages.length,
              itemBuilder: (context, index) => Messages(
                chatMessages: demoChatMessages[index],
              ),
            ),
          ),
        ),
        const ChatInputField()
      ],
    );
  }
}

class Messages extends StatelessWidget {
  const Messages({
    Key? key,
    required this.chatMessages,
  }) : super(key: key);

  final ChatMessage chatMessages;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(chatMessages: message);
        case ChatMessageType.audio:
          return AudioMessage(chatMessages: message);
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding,
      ),
      child: Row(
        mainAxisAlignment: chatMessages.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!chatMessages.isSender) ...[
            CircleAvatar(
              radius: getProportionateScreenWidth(15),
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            SizedBox(
              width: kDefaultPadding / 2,
            ),
          ],
          messageContaint(chatMessages),
        ],
      ),
    );
  }
}

class AudioMessage extends StatelessWidget {
  const AudioMessage({
    Key? key,
    required this.chatMessages,
  }) : super(key: key);

  final ChatMessage chatMessages;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(40),
      padding: const EdgeInsets.only(right: kDefaultPadding / 1.5),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor.withOpacity(chatMessages.isSender ? 0.9 : 0.4),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.play_arrow),
            color: chatMessages.isSender ? Colors.white : kPrimaryColor,
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: chatMessages.isSender ? Colors.white : kPrimaryColor,
                  height: 2,
                ),
                Container(
                  height: getProportionateScreenHeight(10),
                  width: getProportionateScreenHeight(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("0.37"),
          )
        ],
      ),
    );
  }
}
