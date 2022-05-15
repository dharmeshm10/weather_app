abstract class WelcomeState {}

class LoginRegisterState extends WelcomeState {
  bool isLogin;

  LoginRegisterState({
    this.isLogin = true,
  });
}
