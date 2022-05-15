import 'package:flutter/material.dart';
import 'package:weather_app/common/theme_color.dart';
import 'package:weather_app/common/widgets/widget_constants.dart';

class IsAccountWidget extends StatelessWidget {
  final bool login;
  final Function press;
  const IsAccountWidget({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? WidgetConstants.hintDoNotHaveAccount
              : WidgetConstants.hintAlreadyHaveAccount,
          style: const TextStyle(
            color: AppColor.kPrimaryColor,
          ),
        ),
        GestureDetector(
          onTap: press.call(),
          child: Text(
            login ? WidgetConstants.signup : WidgetConstants.signIn,
            style: const TextStyle(
              color: AppColor.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
