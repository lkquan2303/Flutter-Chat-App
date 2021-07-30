import 'package:bloc/bloc.dart';

import '../../repositories/user_repository.dart';
import '../../utils/validators.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  // ignore: sort_constructors_first
  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpState.initial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpEmailChanged) {
      yield* _mapSignUpEmailChangeToState(event.email);
    }
    if (event is SignUpPasswordChanged) {
      yield* _mapSignUpPasswordChangeToState(event.password);
    }
    if (event is SignUpSubmitted) {
      yield* _mapSignUpSubmittedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<SignUpState> _mapSignUpEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<SignUpState> _mapSignUpPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<SignUpState> _mapSignUpSubmittedToState(
      {String? email, String? password}) async* {
    yield SignUpState.loading();
    try {
      await _userRepository.signUp(email!, password!);
      yield SignUpState.success();
    } catch (error) {
      yield SignUpState.failure();
    }
  }
}
