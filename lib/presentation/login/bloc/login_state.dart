abstract class WelcomeState {}

class LoginState extends WelcomeState {
  bool isValid;

  LoginState({
    this.isValid = true,
  });
}
