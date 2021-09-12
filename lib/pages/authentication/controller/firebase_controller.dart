import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../widgets/activity_indicator.dart';
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
    CustomFullScreenDialog.showDialog();
    // ignore: unawaited_futures
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => signIn(email, password))
        // ignore: invalid_return_type_for_catch_error
        .catchError(
          // ignore: invalid_return_type_for_catch_error
          (onError) => {
            Get.back(),
            Get.snackbar('Something went wrong', onError.message),
          },
        );
  }

  //*<-------------- Sign In Function -------------->

  Future<void> signIn(String email, String password) async {
    CustomFullScreenDialog.showDialog();
    // ignore: unawaited_futures
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              Get.off(
                () => ChatScreen(),
              ),
            })
        // ignore: invalid_return_type_for_catch_error
        .catchError(
          // ignore: invalid_return_type_for_catch_error
          (onError) => {
            Get.back(),
            Get.snackbar('Something went wrong', onError.message),
          },
        );
    //
  }

  //*<-------------- Sign Out Function -------------->

  Future<void> signOut() async {
    CustomFullScreenDialog.showDialog();
    // ignore: unawaited_futures
    await _firebaseAuth
        .signOut()
        .then(
          (value) => Get.offAll(
            () => SignInScreen(),
          ),
        )
        .catchError(
          // ignore: invalid_return_type_for_catch_error
          (onError) => {
            Get.back(),
            Get.snackbar('Something went wrong', onError.message),
          },
        );
  }
}
