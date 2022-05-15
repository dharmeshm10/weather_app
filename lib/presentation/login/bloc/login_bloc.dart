import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/login/bloc/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void loginEvent() => emit(
        LoginState(isValid: true),
      );

  void validationEmpty() => emit(
        LoginState(isValid: false),
      );
}
