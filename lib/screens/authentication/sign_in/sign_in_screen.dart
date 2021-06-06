import 'package:flutter/material.dart';

import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/constants/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/image_deco_login.dart';
import 'components/social_sign_in.dart';

class SignInScreen extends StatelessWidget {
  static String routName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(380),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    ImageDecoLogin(
                      imageName: 'assets/images/light-1.png',
                      leftPosited: 20,
                      width: 90,
                      height: 200,
                    ),
                    ImageDecoLogin(
                      imageName: 'assets/images/light-2.png',
                      leftPosited: 150,
                      width: 70,
                      height: 150,
                    ),
                    ImageDecoLogin(
                      imageName: 'assets/images/clock.png',
                      leftPosited: 280,
                      width: 90,
                      height: 200,
                    ),
                    Positioned(
                      child: Container(
                        child: Center(
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(30),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //*<----------- User Validation ----------->
              Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(30)),
                child: Column(
                  children: [
                    //*<---------- User Email ---------->
                    TextFormField(
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
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: getProportionateScreenHeight(200),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
