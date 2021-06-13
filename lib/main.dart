// @dart=2.9
import 'package:flutter/material.dart';

import 'package:chat_app/config/themes/theme.dart';
import 'package:chat_app/config/routes/routes.dart';

import 'modules/welcome/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      title: 'Chat',
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
