// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/common/layout_constants.dart';
import 'package:weather_app/common/local_preferences/local_preference_constants.dart';
import 'package:weather_app/common/local_preferences/local_preferences.dart';
import 'package:weather_app/common/theme_color.dart';
import 'package:weather_app/common/widgets/divider_widget.dart';
import 'package:weather_app/common/widgets/text_field_widget.dart';
import 'package:weather_app/common/widgets/primary_button_widget.dart';
import 'package:weather_app/data/datasources/remote/data_service.dart';
import 'package:weather_app/domain/entities/position_item_entity.dart';
import 'package:weather_app/domain/enum/enum_position_item_type.dart';
import 'package:weather_app/presentation/home/bloc/home_bloc.dart';
import 'package:weather_app/presentation/home/bloc/home_state.dart';
import 'package:weather_app/presentation/home/home_screen_constant.dart';
import 'package:weather_app/data/model/weather_response_model.dart';
import 'package:weather_app/presentation/router/app_router_constants.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;
  final Color titleTextColor;

  const HomeScreen({
    Key? key,
    required this.title,
    required this.color,
    required this.titleTextColor,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  final TextEditingController _cityTextController = TextEditingController();
  final WeatherDataService _dataService = WeatherDataService();

  WeatherResponse? _response;

  final GeolocatorPlatform _geoLocatorPlatform = GeolocatorPlatform.instance;
  final List<PositionItem> _positionItems = <PositionItem>[];

  LocalPreferences? localPreferences;

  String? userName;

  @override
  void initState() {
    super.initState();
    LocalPreferences?.init();
    getUserName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenKey,
      appBar: AppBar(
        key: HomeScreenConstants.appBarKey,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: LayoutConstants.dimen_11),
            child: InkWell(
              onTap: () {
                // Clear local storage
                LocalPreferences?.clear();
                // Remove all route
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouterConstants.welcomeRoute,
                    (Route<dynamic> route) => false);
              },
              child: const IgnorePointer(
                child: Icon(Icons.logout),
              ),
            ),
          ),
        ],
        backgroundColor: widget.color,
        title: Text(
          widget.title.toUpperCase(),
          key: HomeScreenConstants.titleKey,
          style: TextStyle(
            color: widget.titleTextColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: widget.titleTextColor,
        ),
      ),
      body: Center(
        key: HomeScreenConstants.bodyKey,
        child: SingleChildScrollView(
          child: Column(
            key: HomeScreenConstants.weatherDataKey,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response!.iconUrl),
                    Text(
                      '${_response!.tempInfo.temperature}°',
                      style: const TextStyle(fontSize: 40),
                    ),
                    Text(_response!.weatherInfo.description)
                  ],
                ),
              TextFieldWidget(
                hintText: HomeScreenConstants.hintCityName,
                controller: _cityTextController,
                icon: Icons.search,
                onChanged: (value) {
                  _cityTextController.text = value;
                },
              ),
              BlocConsumer<HomeCubit, SearchState>(
                listener: (context, state) {
                  if (state.isSearchEmpty == true) {
                    // Navigator.of(context).pushNamed(
                    //   AppRouterConstants.homeScreen,
                    // );
                  } else if (state.isSearchEmpty == false) {
                    homeScreenKey.currentState!.removeCurrentSnackBar();
                    homeScreenKey.currentState!.showSnackBar(
                      const SnackBar(
                        content: Text('Please enter city name!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return PrimaryButtonWidget(
                    text: HomeScreenConstants.searchText,
                    press: () {
                      if (_cityTextController.text.isNotEmpty) {
                        _search();
                        return;
                      }
                      BlocProvider.of<HomeCubit>(context).validationEmpty();
                    },
                  );
                },
              ),
              const DividerWidget(),
              PrimaryButtonWidget(
                text: HomeScreenConstants.currentLocationText,
                color: AppColor.kPrimaryLightColor,
                textColor: AppColor.black,
                press: () {
                  _getCurrentPosition();
                },
              ),
              Text(
                '${HomeScreenConstants.locationMessage}${userName!}',
                key: HomeScreenConstants.userNameKey,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: LayoutConstants.dimen_12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await _geoLocatorPlatform.getCurrentPosition();
    _updatePositionList(
      PositionItemType.position,
      position.toString(),
    );

    final response = await _dataService.getCurrentLocation(position);
    setState(() => _response = response);
  }

  void _updatePositionList(PositionItemType type, String displayValue) {
    _positionItems.add(PositionItem(type, displayValue));
    setState(() {});
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geoLocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      _updatePositionList(
        PositionItemType.log,
        HomeScreenConstants.kLocationServicesDisabledMessage,
      );
      return false;
    }

    permission = await _geoLocatorPlatform.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await _geoLocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        _updatePositionList(
          PositionItemType.log,
          HomeScreenConstants.kPermissionDeniedMessage,
        );

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      _updatePositionList(
        PositionItemType.log,
        HomeScreenConstants.kPermissionDeniedForeverMessage,
      );
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _updatePositionList(
      PositionItemType.log,
      HomeScreenConstants.kPermissionGrantedMessage,
    );
    return true;
  }

  Future<void> get getUserName async {
    String unm = LocalPreferences.getString(LocalPreferenceConstants.userName);
    userName = unm.toString();
  }
}
