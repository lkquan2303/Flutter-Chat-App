import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/size_config.dart';
import '../../../controller/firebase_controller.dart';
import '../../../sign_up/views/screens/sign_up_screen.dart';
import 'social_sign_in.dart';

class UserValidation extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final firebaseController = Get.find<FirebaseController>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(30)),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            //*<---------- User Email ---------->
            TextFormField(
              controller: _emailController,
              validator: (val) {
                if (val!.isEmpty) {
                  return kAddressNullError;
                }
                if (!emailValidatorRegExp.hasMatch(val)) {
                  return kInvalidEmailError;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Your email or phone number',
                labelText: 'Email',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Container(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenWidth(16),
                    getProportionateScreenWidth(16),
                    getProportionateScreenWidth(16),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/Mail.svg',
                    height: getProportionateScreenHeight(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            //*<---------- User Password ---------->
            TextFormField(
              controller: _passwordController,
              validator: (val) {
                if (val!.isEmpty) {
                  return kPassNullError;
                }
                if (val.length < 6) {
                  return kShortPassError;
                }
              },
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Your password',
                labelText: 'Password',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Container(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenWidth(16),
                    getProportionateScreenWidth(16),
                    getProportionateScreenWidth(16),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/Lock.svg',
                    height: getProportionateScreenHeight(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),

            //*<--------- Login Button --------->
            InkWell(
              onTap: () => {
                //  Navigator.pushNamed(context, ChatScreen.routeName),
                //signIn()
                if (formKey.currentState!.validate())
                  firebaseController.signIn(
                      _emailController.text, _passwordController.text)
                else
                  formKey.currentState!.validate()
              },
              child: Container(
                alignment: Alignment.center,
                width: getProportionateScreenHeight(200),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),

            //*<--------- Social Login -------->
            const SocialSignIn(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),

            //*Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                InkWell(
                  onTap: () =>
                      //Navigator.pushNamed(context, SignUpScreen.routName)
                      Get.to(
                    () => SignUpScreen(),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
