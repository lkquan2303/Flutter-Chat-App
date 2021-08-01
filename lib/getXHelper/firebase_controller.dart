import 'package:chat_app/modules/authentication/sign_in/views/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final Rxn<User> _firebaseUser = Rxn<User>();

  String get user => _firebaseUser.value!.email ?? '';

  @override
  // ignore: must_call_super
  void onInit() {
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
  }

  //*<-------------- Sign Up Function -------------->

  void signUp(String email, String password) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => Get.offAll(
            SignInScreen(),
          ),
        )
        // ignore: invalid_return_type_for_catch_error
        .catchError(
          (error) => Get.snackbar('ERROR', 'Fail to Sign Up'),
        );
  }

  //*<-------------- Sign In Function -------------->

  void signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //*<-------------- Sign Out Function -------------->

  void signOut() async {
    await _firebaseAuth.signOut();
  }
}
