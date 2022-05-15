import 'package:flutter/material.dart';

class HomeScreenConstants {
  // Strings
  static const String hintCityName = 'City name';
  static const String searchText = 'Search';
  static const String currentLocationText = 'Current location';
  static const String kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String kPermissionDeniedMessage = 'Permission denied.';
  static const String kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String kPermissionGrantedMessage = 'Permission granted.';
  static const String locationMessage = '*Displaying current location for ';

  // Keys
  static const appBarKey = ValueKey('home_screen_app_bar_key');
  static const titleKey = ValueKey('home_screen_title_key');
  static const bodyKey = ValueKey('home_screen_body_key');
  static const weatherDataKey = ValueKey('weather_data_key');
  static const userNameKey = ValueKey('user_name_key');
}
