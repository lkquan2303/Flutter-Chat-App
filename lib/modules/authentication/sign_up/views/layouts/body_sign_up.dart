import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/size_config.dart';
import '../../../sign_in/views/widgets/social_sign_in.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(25),
            vertical: getProportionateScreenHeight(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Container(
                height: getProportionateScreenHeight(250),
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/images/sign_up_deco.svg',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Type your account',
                  labelText: 'Account',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Type your password',
                  labelText: 'Password',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Re-Type your password',
                  labelText: 'Re-Password',
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: getProportionateScreenHeight(35),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.black54,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Or'),
                  ),
                  const Expanded(
                    child: Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              const SocialSignIn(),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You already an account? ',
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(15),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(15),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
