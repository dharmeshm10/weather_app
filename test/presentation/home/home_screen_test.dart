import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/common/widgets/primary_button_widget.dart';
import 'package:weather_app/common/widgets/text_field_widget.dart';
import 'package:weather_app/presentation/home/bloc/home_bloc.dart';
import 'package:weather_app/presentation/home/home_screen.dart';
import 'package:weather_app/presentation/home/home_screen_constant.dart';

import '../__mock__/mock_navigation_observer.dart';

void main() {
  Future<void> _buildWidget(WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
          ),
        ],
        child: MaterialApp(
          home: const HomeScreen(
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
      ' [HomeScreen]', (WidgetTester tester) async {
    await _buildWidget(tester);
    expect(find.byKey(HomeScreenConstants.appBarKey), findsOneWidget);
    expect(find.byKey(HomeScreenConstants.titleKey), findsOneWidget);
    expect(find.byKey(HomeScreenConstants.bodyKey), findsOneWidget);
    expect(find.byKey(HomeScreenConstants.weatherDataKey), findsOneWidget);
    expect(find.byType(TextFieldWidget), findsOneWidget);
    expect(find.byKey(HomeScreenConstants.userNameKey), findsOneWidget);
  });

  testWidgets(
      'should render title properly'
      ' [HomeScreen]', (WidgetTester tester) async {
    await _buildWidget(tester);
    // verify
    expect(find.text('title'), findsNothing);
    expect(find.text('TITLE'), findsOneWidget);
  });

  testWidgets(
      'should render properly '
      '[PrimaryButtonWidget]', (WidgetTester tester) async {
    await _buildWidget(tester);
    expect(find.byType(PrimaryButtonWidget), findsNWidgets(2));
  });
}
