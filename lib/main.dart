// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/theme.dart';
import 'pages/authentication/IsSignIn.dart';
import 'pages/globals_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // initialRoute: WelcomeScreen.routeName,
      home: Homepage(),
      getPages: AppPages.pagesList,
      initialBinding: GlobalsBindings(),
    );
  }
}
