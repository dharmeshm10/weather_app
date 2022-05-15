// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/layout_constants.dart';
import 'package:weather_app/common/local_preferences/local_preference_constants.dart';
import 'package:weather_app/common/local_preferences/local_preferences.dart';
import 'package:weather_app/common/widgets/is_account_widget.dart';
import 'package:weather_app/common/widgets/primary_button_widget.dart';
import 'package:weather_app/common/widgets/text_field_widget.dart';
import 'package:weather_app/common/widgets/password_text_field.dart';
import 'package:weather_app/presentation/login/bloc/login_bloc.dart';
import 'package:weather_app/presentation/login/bloc/login_state.dart';
import 'package:weather_app/presentation/login/login_constants.dart';
import 'package:weather_app/presentation/router/app_router_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    required this.title,
    required this.color,
    required this.titleTextColor,
  }) : super(key: key);

  final String title;
  final Color color;
  final Color titleTextColor;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> loginScreenKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  LocalPreferences? localPreferences = LocalPreferences();

  @override
  void initState() {
    super.initState();
    LocalPreferences?.init();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: loginScreenKey,
      appBar: AppBar(
        key: LoginConstants.appBarKey,
        backgroundColor: widget.color,
        title: Text(
          widget.title.toUpperCase(),
          key: LoginConstants.titleKey,
          style: TextStyle(
            color: widget.titleTextColor,
          ),
        ),
        iconTheme: IconThemeData(color: widget.titleTextColor),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          key: LoginConstants.bodyKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                hintText: LoginConstants.hintUsername,
                controller: userNameController,
                onChanged: (value) {
                  userNameController.text = value;
                  // TODO(Dharmesh): For validation code
                },
              ),
              PasswordTextField(
                onChanged: (value) {
                  // TODO(Dharmesh): For validation code
                },
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.isValid == true) {
                    Navigator.of(context).pushNamed(
                      AppRouterConstants.homeScreen,
                    );
                  } else if (state.isValid == false) {
                    loginScreenKey.currentState!.removeCurrentSnackBar();
                    loginScreenKey.currentState!.showSnackBar(
                      const SnackBar(
                        content: Text(LoginConstants.usernameErrorMessage),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return PrimaryButtonWidget(
                    text: LoginConstants.login,
                    press: () {
                      if (userNameController.text.isNotEmpty) {
                        LocalPreferences.putString(
                          LocalPreferenceConstants.userName,
                          userNameController.text,
                        );
                        BlocProvider.of<LoginCubit>(context).loginEvent();
                        return;
                      }
                      BlocProvider.of<LoginCubit>(context).validationEmpty();
                    },
                  );
                },
              ),
              SizedBox(height: size.height * LayoutConstants.dimen_0_0_3),
              IsAccountWidget(
                login: true,
                press: () {
                  // TODO(Dharmesh): Navigation
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
