import 'package:chat_app/modules/authentication/sign_in/layouts/body_login.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String routName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyLogin(),
    );
  }
}
