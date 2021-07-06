import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../models/Chat.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.65,
          horizontal: kDefaultPadding,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(chat.image),
                  radius: 25,
                ),
                if (chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: getProportionateScreenHeight(14),
                      height: getProportionateScreenHeight(14),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Opacity(
                      opacity: 0.65,
                      child: Text(
                        chat.lastMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(opacity: 0.64, child: Text(chat.time))
          ],
        ),
      ),
    );
  }
}
