class SignUpState {
  final bool? isEmailValid;
  final bool? isPasswordValid;
  final bool? isSubmitting;
  final bool? isSuccess;
  final bool? isFailure;

  bool get isFormValid => isEmailValid! && isPasswordValid!;

  // ignore: sort_constructors_first
  SignUpState({
    this.isEmailValid,
    this.isPasswordValid,
    this.isSubmitting,
    this.isSuccess,
    this.isFailure,
  });

  // ignore: sort_constructors_first
  factory SignUpState.initial() {
    return SignUpState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  // ignore: sort_constructors_first
  factory SignUpState.loading() {
    return SignUpState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  // ignore: sort_constructors_first
  factory SignUpState.success() {
    return SignUpState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  // ignore: sort_constructors_first
  factory SignUpState.failure() {
    return SignUpState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true);
  }

  SignUpState copyWith({
    required bool isEmailValid,
    required bool isPasswordValid,
    required bool isSubmitting,
    required bool isSuccess,
    required bool isFailure,
  }) {
    return SignUpState(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
    );
  }

  // ignore: lines_longer_than_80_chars
  SignUpState update({
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return SignUpState(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }
}
