import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/presentation/login/bloc/login_bloc.dart';
import 'package:weather_app/presentation/login/login_constants.dart';
import 'package:weather_app/presentation/login/login_screen.dart';

import '../__mock__/mock_navigation_observer.dart';

void main() {
  Future<void> _buildWidget(WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
        ],
        child: MaterialApp(
          home: const LoginScreen(
            titleTextColor: Colors.white,
            color: Colors.blue,
            title: 'title',
          ),
          navigatorObservers: [mockObserver],
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets(
      'should render properly'
      ' [LoginScreen]', (WidgetTester tester) async {
    await _buildWidget(tester);
    expect(find.byKey(LoginConstants.appBarKey), findsOneWidget);
    expect(find.byKey(LoginConstants.titleKey), findsOneWidget);
    expect(find.byKey(LoginConstants.bodyKey), findsOneWidget);
  });

  testWidgets(
      'should render title properly'
      ' [LoginScreen]', (WidgetTester tester) async {
    await _buildWidget(tester);
    // verify
    expect(find.text('title'), findsNothing);
    expect(find.text('TITLE'), findsOneWidget);
  });
}
