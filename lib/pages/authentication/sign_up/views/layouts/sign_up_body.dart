import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/size_config.dart';
import '../../../controller/firebase_controller.dart';
import '../../../sign_in/views/widgets/social_sign_in.dart';

class SignUpBody extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  final firebaseController = Get.find<FirebaseController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(25),
            vertical: getProportionateScreenHeight(20),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: Get.back,
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

                //*<---------- Sign Up User Info ---------->
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return kAddressNullError;
                    }
                    if (!emailValidatorRegExp.hasMatch(val)) {
                      return kInvalidEmailError;
                    }
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Type your account',
                    labelText: 'Account',
                  ),
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return kPassNullError;
                    }
                    if (val.length < 6) {
                      return kShortPassError;
                    }
                  },
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Type your password',
                    labelText: 'Password',
                  ),
                ),
                TextFormField(
                  validator: (val) {
                    if (_rePasswordController.text !=
                        _passwordController.text) {
                      return 'Password miss match';
                    }
                  },
                  obscureText: true,
                  controller: _rePasswordController,
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
                  onTap: () => {
                    if (!_formKey.currentState!.validate())
                      _formKey.currentState!.validate()
                    else
                      firebaseController.signUp(
                        _emailController.text,
                        _passwordController.text,
                      ),
                  },
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

                //*<---------- Sign Up User Info ---------->
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
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

                //*<------------ Social Sign In ----------->
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
                        onTap: Get.back,
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
      ),
    );
  }
}
