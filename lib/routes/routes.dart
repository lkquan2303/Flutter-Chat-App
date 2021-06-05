import 'package:chat_app/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:chat_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routName: (context) => SignInScreen()
};
