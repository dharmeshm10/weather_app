import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/layout_constants.dart';
import 'package:weather_app/common/widgets/primary_button_widget.dart';
import 'package:weather_app/common/theme_color.dart';
import 'package:weather_app/presentation/router/app_router_constants.dart';
import 'package:weather_app/presentation/welcome/bloc/welcome_bloc.dart';
import 'package:weather_app/presentation/welcome/bloc/welcome_state.dart';
import 'package:weather_app/presentation/welcome/welcome_screen_constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  GlobalKey<ScaffoldState> welcomeScreenKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: welcomeScreenKey,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<WelcomeCubit, LoginRegisterState>(
              listener: (context, state) {
                if (state.isLogin == true) {
                  Navigator.of(context).pushNamed(
                    AppRouterConstants.loginRoute,
                    arguments: welcomeScreenKey,
                  );
                } else if (state.isLogin == false) {
                  Navigator.of(context).pushNamed(
                    AppRouterConstants.signUpScreen,
                  );
                }
              },
              builder: (context, state) {
                return PrimaryButtonWidget(
                  key: WelcomeScreenConstants.loginButtonKey,
                  text: WelcomeScreenConstants.login,
                  color: AppColor.kPrimaryColor,
                  textColor: AppColor.white,
                  press: () {
                    BlocProvider.of<WelcomeCubit>(context).loginEvent();
                  },
                );
              },
            ),
            const SizedBox(
              height: LayoutConstants.dimen_24,
            ),
            PrimaryButtonWidget(
              key: WelcomeScreenConstants.signUpButtonKey,
              text: WelcomeScreenConstants.signup,
              color: AppColor.kPrimaryLightColor,
              textColor: AppColor.black,
              press: () {
                BlocProvider.of<WelcomeCubit>(context).signupEvent();
              },
            ),
          ],
        ),
      ),
    );
  }
}
