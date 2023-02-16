import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/app/data/data_sources/local/prefrancemanager.dart';
import 'package:weather/app/domain/entities/location_model.dart';
import 'package:weather/app/domain/response/weather_response.dart';
import 'package:weather/app/presentation/router/approutes.dart';
import 'package:weather/app/shared/constant/app_value.dart';
import 'package:weather/app/shared/constant/string_keys.dart';
import 'package:weather/app/shared/core/base/baseviewmodel.dart';

import '../../../shared/style/widgets.dart';

class MainViewModel extends BaseViewModel {
  PreferenceManager preferenceManager;

  MainViewModel(this.preferenceManager);

  late List<PopUpModel> popupmodel;
  WeatherResponse? weather;
  LocationModel? location;
  bool _screenError = false;
  bool _screenLoader = false;
  int _viewIndex = 0;

  bool get screenError => _screenError;

  set screenError(bool value) {
    _screenError = value;
    notifyListeners();
  }

  bool get screenLoader => _screenLoader;

  set screenLoader(bool value) {
    _screenLoader = value;
    notifyListeners();
  }

  int get viewIndex => _viewIndex;

  set viewIndex(int value) {
    _viewIndex = value;
    notifyListeners();
  }

  //=========================
  Future<void> refreshScreen(BuildContext context) async =>
      context.go(AppRoutes.splash);

  //=========================
  void toAboutUs(BuildContext context) async => context.push(AppRoutes.aboutUs);

  //=========================
  void hourlyWeather() => viewIndex = 0;

  //=-========================
  void dailyWeather() => viewIndex = 1;

  //=========================
  Future<void> getLastWeather() async {
    String response = await preferenceManager.getLastWeather();
    if (response.isNotEmpty) {
      weather = WeatherResponse.fromJson(jsonDecode(response));
    } else {
      screenError = true;
    }
  }
//================================================================
  Future<void> getCurrentLocation() async {
    String response = await preferenceManager.getCurrentLocation();
    if (response.isNotEmpty) {
      location = LocationModel.fromJson(jsonDecode(response));
    } else {
      location=AppValues.defaultLocation;
    }
  }
  //================================================================
  void widgetInit() {
    popupmodel=[
      PopUpModel(title: StringsKeys.hourlyWeather.tr(), func: hourlyWeather),
      PopUpModel(title: StringsKeys.weatherByDay.tr(), func: dailyWeather),
    ];
  }
  //================================================================================================
Future<void> init()async{
    setBusy(true);
    widgetInit();
    try {
      await Future.wait([
        getCurrentLocation(),
        getLastWeather(),
      ]);
    }catch(e){log(e.toString());screenError=true;}
    setBusy(false);
}
}
