import 'package:chat_app/modules/authentication/sign_in/screens/sign_in_screen.dart';
import 'package:chat_app/modules/home_page/screens/chat_screen.dart';
import 'package:chat_app/modules/messages/screens/messages.dart';
import 'package:chat_app/modules/welcome/screens/welcome_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routName: (context) => SignInScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  MessagesScreen.routeName: (context) => MessagesScreen()
};
