import 'package:bloc/bloc.dart';

import '../../repositories/user_repository.dart';
import '../../utils/validators.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;
  SignInBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignInState.initial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInEmailChange) {
      yield* _mapLoginEmailChangeToState(event.email);
    }
    if (event is SignInPasswordChanged) {
      yield* _mapLoginPasswordChangeToState(event.password);
    }
    if (event is SignInWithCredentialsPressed) {
      // ignore: lines_longer_than_80_chars
      yield* _mapLoginWithCredentialsPressedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<SignInState> _mapLoginEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<SignInState> _mapLoginPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<SignInState> _mapLoginWithCredentialsPressedToState(
      {required String email, required String password}) async* {
    yield SignInState.loading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield SignInState.success();
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
