import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<User?> _firebaseUser = Rx<User>();

  String? get user => _firebaseUser.value!.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  //*<-------------- Sign Up Function -------------->

  void signUp(String email, String password) {}

  //*<-------------- Sign In Function -------------->

  void signIn(String email, String password) {}

  //*<-------------- Sign Out Function -------------->

  void signOut() {}
}
