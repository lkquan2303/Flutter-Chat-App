import 'package:flutter/widgets.dart';

import '../../modules/authentication/sign_in/views/screens/sign_in_screen.dart';
import '../../modules/authentication/sign_up/views/screens/sign_up_screen.dart';
import '../../modules/home_page/views/screens/chat_screen.dart';
import '../../modules/messages/views/screens/messages.dart';
import '../../modules/welcome/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routName: (context) => SignInScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  MessagesScreen.routeName: (context) => MessagesScreen(),
  SignUpScreen.routName: (context) => SignUpScreen()
};
