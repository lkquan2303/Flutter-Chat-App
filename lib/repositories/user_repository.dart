import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  // ignore: sort_constructors_first
  UserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<User?> signInWithCredentials(String email, String password) async {
    try {
      final auth = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final auth = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    // ignore: await_only_futures
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<User?> getUser() async {
    // ignore: await_only_futures
    return await _firebaseAuth.currentUser;
  }
}
