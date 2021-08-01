// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'config/routes/routes.dart';
import 'config/themes/theme.dart';
import 'modules/welcome/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      title: 'Chat',
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
