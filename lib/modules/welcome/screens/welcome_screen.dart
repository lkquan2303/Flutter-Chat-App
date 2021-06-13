import 'package:chat_app/modules/authentication/sign_in/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/constants/size_config.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            SvgPicture.asset(
              'assets/images/flash_image.svg',
              height: getProportionateScreenWidth(300),
            ),
            Text(
              'Welcome to our freedom \nmessaging app',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'Freedom talk any ferson of your \nmother language',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            Spacer(
              flex: 4,
            ),
            FittedBox(
              child: TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, SignInScreen.routName),
                child: Row(
                  children: [
                    Text(
                      'Skip',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.8),
                          ),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
