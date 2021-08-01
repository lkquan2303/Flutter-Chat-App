import 'package:flutter/material.dart';
import '../layouts/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  static String routName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
