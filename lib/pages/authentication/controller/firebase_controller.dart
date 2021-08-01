import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../dash_board/views/screens/dash_board_screen.dart';
import '../sign_in/views/screens/sign_in_screen.dart';

class FirebaseController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final Rxn<User> _firebaseUser = Rxn<User>();

  String get userEmail => _firebaseUser.value?.email ?? '';

  @override
  // ignore: must_call_super
  void onInit() {
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
  }

  //*<-------------- Sign Up Function -------------->

  Future<void> signUp(String email, String password) async {
    // ignore: unawaited_futures
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => Get.offAll(
            () => ChatScreen(),
          ),
        )
        // ignore: invalid_return_type_for_catch_error
        .catchError(
          // ignore: invalid_return_type_for_catch_error
          (onError) => Get.snackbar('Something went wrong', onError.message),
        );
  }

  //*<-------------- Sign In Function -------------->

  Future<void> signIn(String email, String password) async {
    // ignore: unawaited_futures
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => Get.off(
            () => ChatScreen(),
          ),
        )
        // ignore: invalid_return_type_for_catch_error
        .catchError(
            // ignore: invalid_return_type_for_catch_error
            (onError) => Get.snackbar('Something went wrong', onError.message));
  }

  //*<-------------- Sign Out Function -------------->

  Future<void> signOut() async {
    // ignore: unawaited_futures
    await _firebaseAuth.signOut().then(
          (value) => Get.offAll(
            () => SignInScreen(),
          ),
        );
  }
}
