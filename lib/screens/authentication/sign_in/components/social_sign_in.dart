import 'package:chat_app/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/google-icon.svg",
          height: getProportionateScreenHeight(25),
          width: getProportionateScreenWidth(25),
        ),
        SizedBox(
          width: getProportionateScreenHeight(20),
        ),
        SvgPicture.asset(
          "assets/icons/Phone.svg",
          height: getProportionateScreenHeight(25),
          width: getProportionateScreenWidth(25),
        ),
        SizedBox(
          width: getProportionateScreenHeight(20),
        ),
        SvgPicture.asset(
          "assets/icons/twitter.svg",
          height: getProportionateScreenHeight(25),
          width: getProportionateScreenWidth(25),
        ),
      ],
    );
  }
}
