import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/common/widgets/text_field_widget.dart';
import 'package:weather_app/presentation/sign_up/sign_up_constants.dart';
import 'package:weather_app/presentation/sign_up/sign_up_screen.dart';

import '../__mock__/mock_navigation_observer.dart';

void main() {
  Future<void> _buildWidget(WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: const SignUpScreen(
          titleTextColor: Colors.white,
          color: Colors.blue,
          title: 'title',
        ),
        navigatorObservers: [mockObserver],
      ),
    );
    await tester.pump();
  }

  testWidgets(
      'should render properly '
      '[SignUpScreen]', (WidgetTester tester) async {
    await _buildWidget(tester);
    expect(find.byKey(SignUpConstants.appBarKey), findsOneWidget);
    expect(find.byKey(SignUpConstants.centerWidgetKey), findsOneWidget);
    expect(find.byKey(SignUpConstants.isAccountLoginKey), findsOneWidget);
    expect(find.byType(TextFieldWidget), findsOneWidget);
  });

  testWidgets(
      'should  navigate properly '
      'when click on button ', (WidgetTester tester) async {
    // await _buildWidget(tester);
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: const SignUpScreen(
          titleTextColor: Colors.white,
          color: Colors.blue,
          title: 'title',
        ),
        navigatorObservers: [mockObserver],
      ),
    );
    await tester.pump();

    expect(find.byKey(SignUpConstants.appBarKey), findsOneWidget);
    expect(find.byKey(SignUpConstants.centerWidgetKey), findsOneWidget);
    expect(find.byKey(SignUpConstants.signUpButtonKey), findsOneWidget);
  });
}
