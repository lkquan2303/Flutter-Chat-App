import 'package:flutter/material.dart';

import '../widgets/top_sign_in_image.dart';
import '../widgets/user_validation.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          children: [
            //*<----------- Sign In Top Image ----------->
            const TopSignInImage(),

            //*<----------- User Validation ----------->
            UserValidation()
          ],
        ),
      ),
    );
  }
}
