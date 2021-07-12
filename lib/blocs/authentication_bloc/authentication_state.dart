import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

// ignore: must_be_immutable
class AuthenticationSuccess extends AuthenticationState {
  User? firebaseUser;
  // ignore: sort_constructors_first
  AuthenticationSuccess({required this.firebaseUser});
}

class AuthenticationFailure extends AuthenticationState {}
