import 'package:flutter/material.dart';
import '../layouts/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SignUpBody(),
      ),
    );
  }
}
