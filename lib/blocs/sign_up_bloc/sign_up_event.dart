import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  // ignore: sort_constructors_first
  SignUpEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;

  // ignore: sort_constructors_first
  SignUpPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class SignUpSubmitted extends SignUpEvent {
  final String email;
  final String password;

  SignUpSubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
