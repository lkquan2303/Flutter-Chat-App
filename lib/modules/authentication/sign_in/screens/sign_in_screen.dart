import 'package:flutter/material.dart';
import '../layouts/body_login.dart';

class SignInScreen extends StatelessWidget {
  static String routName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyLogin(),
    );
  }
}
