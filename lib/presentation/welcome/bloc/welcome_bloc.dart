import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/welcome/bloc/welcome_state.dart';

class WelcomeCubit extends Cubit<LoginRegisterState> {
  WelcomeCubit() : super(LoginRegisterState());

  void loginEvent() => emit(
        LoginRegisterState(
          isLogin: true,
        ),
      );

  void signupEvent() => emit(
        LoginRegisterState(
          isLogin: false,
        ),
      );
}
