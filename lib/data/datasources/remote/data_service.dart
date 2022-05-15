import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/datasources/remote/remote_constant.dart';
import 'package:weather_app/data/model/weather_response_model.dart';

class WeatherDataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    debugPrint('city::$city');
    final queryParameters = {
      'q': city.toString(),
      'appid': WeatherDataConstant.appID,
      'units': WeatherDataConstant.units,
    };

    final uri = Uri.https(
      WeatherDataConstant.authority,
      WeatherDataConstant.unencodedPath,
      queryParameters,
    );

    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }

  Future<WeatherResponse> getCurrentLocation(Position position) async {
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    final queryParameters = {
      'lat': position.latitude.toString(),
      'lon': position.longitude.toString(),
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'imperial'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
