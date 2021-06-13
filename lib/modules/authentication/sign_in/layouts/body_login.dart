import 'package:chat_app/modules/authentication/sign_in/widgets/top_sign_in_image.dart';
import 'package:chat_app/modules/authentication/sign_in/widgets/user_validation.dart';
import 'package:flutter/material.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            //*<----------- Sign In Top Image ----------->
            TopSignInImage(),

            //*<----------- User Validation ----------->
            UserValidation()
          ],
        ),
      ),
    );
  }
}
