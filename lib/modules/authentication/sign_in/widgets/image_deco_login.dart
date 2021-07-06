import 'package:flutter/material.dart';
import '../../../../constants/size_config.dart';

class ImageDecoLogin extends StatelessWidget {
  const ImageDecoLogin({
    Key? key,
    required this.imageName,
    required this.width,
    required this.height,
    required this.leftPosited,
  }) : super(key: key);

  final String imageName;
  final int width;
  final int height;
  final double leftPosited;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosited,
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageName,
            ),
          ),
        ),
      ),
    );
  }
}
