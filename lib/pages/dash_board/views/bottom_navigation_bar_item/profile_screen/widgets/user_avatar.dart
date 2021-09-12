import 'package:flutter/material.dart';

import '../../../../../../constants/size_config.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage('assets/images/user_3.png'),
          radius: getProportionateScreenHeight(55),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
