abstract class LoginState {}

class InitialLogin extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLogin extends LoginState {}

class FailureLogin extends LoginState {
  final String errorMessage;

  FailureLogin(this.errorMessage);
}
