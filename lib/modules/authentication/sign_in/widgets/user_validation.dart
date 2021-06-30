import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/constants/size_config.dart';
import 'package:chat_app/modules/authentication/sign_in/widgets/social_sign_in.dart';
import 'package:chat_app/modules/home_page/screens/chat_screen.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/flutter_svg.dart';

class UserValidation extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  signIn() {
    formKey.currentState!.validate();
  }

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
              validator: (val) {
                if (val!.isEmpty) {
                  return kAddressNullError;
                }
                if (!emailValidatorRegExp.hasMatch(val!)) {
                  return kInvalidEmailError;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Your email or phone number",
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Container(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenWidth(16),
                    getProportionateScreenWidth(16),
                    getProportionateScreenWidth(16),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Mail.svg",
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
                hintText: "Your password",
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Container(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    getProportionateScreenWidth(16),
                    getProportionateScreenWidth(16),
                    getProportionateScreenWidth(16),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Lock.svg",
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
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password",
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
                signIn()
              },
              child: Container(
                alignment: Alignment.center,
                width: getProportionateScreenHeight(200),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Login",
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
            SocialSignIn(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),

            //*Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                InkWell(
                  child: Text(
                    "Sign Up",
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
