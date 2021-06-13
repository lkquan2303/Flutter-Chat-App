import 'package:chat_app/constants/size_config.dart';
import 'package:flutter/material.dart';

import 'image_deco_login.dart';

class TopSignInImage extends StatelessWidget {
  const TopSignInImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(380),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          ImageDecoLogin(
            imageName: 'assets/images/light-1.png',
            leftPosited: 20,
            width: 90,
            height: 200,
          ),
          ImageDecoLogin(
            imageName: 'assets/images/light-2.png',
            leftPosited: 150,
            width: 70,
            height: 150,
          ),
          ImageDecoLogin(
            imageName: 'assets/images/clock.png',
            leftPosited: 280,
            width: 90,
            height: 200,
          ),
          Positioned(
            child: Container(
              child: Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
