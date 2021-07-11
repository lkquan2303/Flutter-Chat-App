import 'package:flutter/material.dart';
import '../layouts/body_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  static String routName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: BodySignUp(),
      ),
    );
  }
}
