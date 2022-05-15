// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/common/widgets/divider_widget.dart';
import 'package:weather_app/common/widgets/primary_button_widget.dart';
import 'package:weather_app/presentation/login/bloc/login_bloc.dart';
import 'package:weather_app/presentation/welcome/bloc/welcome_bloc.dart';
import 'package:weather_app/presentation/welcome/welcome_screen.dart';
import 'package:weather_app/presentation/welcome/welcome_screen_constants.dart';

import '../__mock__/mock_navigation_observer.dart';

void main() {
  Future<void> _buildWidget(WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<WelcomeCubit>(
            create: (context) => WelcomeCubit(),
          ),
        ],
        child: MaterialApp(
          home: const WelcomeScreen(
            title: 'title',
            color: Colors.white,
          ),
          navigatorObservers: [mockObserver],
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets(
      'should render properly '
      '[WelcomeScreen]', (WidgetTester tester) async {
    //when
    await _buildWidget(tester);

    //then
    expect(find.text('title'), findsOneWidget);
    expect(find.text(WelcomeScreenConstants.login), findsOneWidget);
    expect(find.text(WelcomeScreenConstants.signup), findsOneWidget);
    expect(find.byKey(WelcomeScreenConstants.loginButtonKey), findsOneWidget);
    expect(find.byKey(WelcomeScreenConstants.signUpButtonKey), findsOneWidget);
  });

  testWidgets(
      'should render properly '
      '[PrimaryButtonWidget]', (WidgetTester tester) async {
    //when
    await _buildWidget(tester);
    //then
    expect(find.byType(PrimaryButtonWidget), findsNWidgets(2));
  });
}
