import 'package:flutter/material.dart';
import 'package:weather_app/common/widgets/is_account_widget.dart';
import 'package:weather_app/common/widgets/primary_button_widget.dart';
import 'package:weather_app/common/widgets/text_field_widget.dart';
import 'package:weather_app/common/widgets/password_text_field.dart';
import 'package:weather_app/presentation/sign_up/sign_up_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
    required this.title,
    required this.color,
    required this.titleTextColor,
  }) : super(key: key);

  final String title;
  final Color color;
  final Color titleTextColor;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        key: SignUpConstants.appBarKey,
        backgroundColor: widget.color,
        title: Text(
          widget.title.toUpperCase(),
          style: TextStyle(
            color: widget.titleTextColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: widget.titleTextColor,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          key: SignUpConstants.centerWidgetKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                key: SignUpConstants.userNameTextFieldKey,
                hintText: SignUpConstants.hintUsername,
                onChanged: (value) {
                  // TODO(Dharmesh): For validation code
                },
                controller: userTextEditingController,
              ),
              PasswordTextField(
                onChanged: (value) {
                  // TODO(Dharmesh): For validation code
                },
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PrimaryButtonWidget(
                      key: SignUpConstants.signUpButtonKey,
                      text: SignUpConstants.signup,
                      press: () {
                        // TODO(Dharmesh): handle signup
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              IsAccountWidget(
                key: SignUpConstants.isAccountLoginKey,
                login: false,
                press: () {
                  // TODO(Dharmesh): handle IsAccountWidget
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
