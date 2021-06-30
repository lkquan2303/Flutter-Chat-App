import 'package:flutter/material.dart';

import 'package:chat_app/constants/constants.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
        horizontal: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: kPrimaryColor.withOpacity(0.3),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              color: kPrimaryColor,
              onPressed: () {},
              icon: Icon(
                Icons.mic,
              ),
            ),

            //* <-------------- Text Input -------------->
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kPrimaryColor.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    //* <----------- Eni ----------->
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.64),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    //* <-------------- Upload File ------------->
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.attach_file,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.64),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.64),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
