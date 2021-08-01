import 'package:flutter/material.dart';

import '../../../home_page/views/layouts/app_bar.dart';
import '../layout/body_messages.dart';

class MessagesScreen extends StatelessWidget {
  static String routeName = '/messages_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyMessages(),
    );
  }
}
