import 'package:chat_app/constants/theme.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

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
