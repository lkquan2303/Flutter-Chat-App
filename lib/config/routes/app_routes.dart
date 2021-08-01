import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

import '../../pages/authentication/sign_in/views/screens/sign_in_screen.dart';
import '../../pages/authentication/sign_up/views/screens/sign_up_screen.dart';
import '../../pages/home_page/views/screens/chat_screen.dart';
import '../../pages/messages/views/screens/messages.dart';
import '../../pages/welcome/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routName: (context) => SignInScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  MessagesScreen.routeName: (context) => MessagesScreen(),
  SignUpScreen.routName: (context) => SignUpScreen()
};

mixin AppPages {
  static List<GetPage> pagesList = [
    GetPage(
      name: WelcomeScreen.routeName,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: ChatScreen.routeName,
      page: () => ChatScreen(),
    ),
    GetPage(
      name: MessagesScreen.routeName,
      page: () => MessagesScreen(),
    ),
    GetPage(
      name: SignInScreen.routName,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: SignUpScreen.routName,
      page: () => SignUpScreen(),
    ),
  ];
}

final appRoutes = [
  GetPage(
    name: WelcomeScreen.routeName,
    page: () => WelcomeScreen(),
  ),
  GetPage(
    name: ChatScreen.routeName,
    page: () => ChatScreen(),
  ),
  GetPage(
    name: MessagesScreen.routeName,
    page: () => MessagesScreen(),
  ),
  GetPage(
    name: SignInScreen.routName,
    page: () => SignInScreen(),
  ),
  GetPage(
    name: SignUpScreen.routName,
    page: () => SignUpScreen(),
  ),
];
