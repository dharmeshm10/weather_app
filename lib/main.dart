import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';

import 'package:weather_app/common/theme_color.dart';
import 'package:weather_app/presentation/home/bloc/home_bloc.dart';
import 'package:weather_app/presentation/login/bloc/login_bloc.dart';
import 'package:weather_app/presentation/router/app_router.dart';
import 'package:weather_app/presentation/splash/splash_screen.dart';
import 'package:weather_app/presentation/welcome/bloc/welcome_bloc.dart';

import 'common/supervisor_bloc/supervisor_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  );
  BlocOverrides.runZoned(
    () {
      runApp(
        MyApp(),
      );
    },
    blocObserver: SupervisorBloc(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeCubit>(
          create: (context) => WelcomeCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: AppColor.kPrimaryColor,
          scaffoldBackgroundColor: AppColor.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.onGenerateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
