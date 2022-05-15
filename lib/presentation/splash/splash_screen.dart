import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/common/layout_constants.dart';
import 'package:weather_app/common/theme_color.dart';
import 'package:weather_app/presentation/router/app_router_constants.dart';
import 'package:weather_app/presentation/splash/splash_constants.dart';
import 'package:weather_app/presentation/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const WelcomeScreen(
            title: AppRouterConstants.screenTitle,
            color: AppColor.kPrimaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kPrimaryLightColor,
      child: const Center(
        child: Text(
          SplashConstant.appName,
          style: TextStyle(
            color: AppColor.kPrimaryColor,
            fontSize: LayoutConstants.dimen_24,
          ),
        ),
      ),
    );
  }
}
