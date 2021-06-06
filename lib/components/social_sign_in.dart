import 'package:chat_app/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

FadeAnimation buildSocialSignIn() {
  return FadeAnimation(
      1.3,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialSignIn(
            image: "assets/icons/google-icon.svg",
            onPress: () {},
          ),
          SocialSignIn(
            image: "assets/icons/Phone.svg",
            onPress: () {},
          ),
          SocialSignIn(
            image: "assets/icons/twitter.svg",
            onPress: () {},
          ),
        ],
      ));
}

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    Key key,
    @required this.image,
    @required this.onPress,
  }) : super(key: key);
  final String image;
  final GestureTapCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        padding: EdgeInsets.all(13),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
