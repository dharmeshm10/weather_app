import 'package:flutter/material.dart';
import 'package:weather_app/presentation/home/home_screen.dart';
import 'package:weather_app/presentation/router/app_router_constants.dart';
import 'package:weather_app/presentation/login/login_screen.dart';
import 'package:weather_app/presentation/sign_up/sign_up_screen.dart';
import 'package:weather_app/common/theme_color.dart';
import 'package:weather_app/presentation/welcome/welcome_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterConstants.welcomeRoute:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(
            title: AppRouterConstants.screenTitle,
            color: AppColor.kPrimaryColor,
          ),
        );
      case AppRouterConstants.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(
            title: AppRouterConstants.screenTitle1,
            color: AppColor.kPrimaryColor,
            titleTextColor: AppColor.white,
          ),
        );
      case AppRouterConstants.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(
            title: AppRouterConstants.screenTitle2,
            color: AppColor.kPrimaryLightColor,
            titleTextColor: AppColor.black,
          ),
        );
        case AppRouterConstants.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: AppRouterConstants.screenTitle3,
            color: AppColor.kPrimaryColor,
            titleTextColor: AppColor.white,
          ),
        );
      default:
        return null;
    }
  }
}
