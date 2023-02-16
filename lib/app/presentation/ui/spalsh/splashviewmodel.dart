import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geocoding/geocoding.dart';
import 'package:weather/app/data/data_sources/local/prefrancemanager.dart';
import 'package:weather/app/data/data_sources/remote/WeatherRepository.dart';
import 'package:weather/app/domain/entities/location_model.dart';
import 'package:weather/app/domain/requests/location_requests.dart';
import 'package:weather/app/domain/requests/weather_request.dart';
import 'package:weather/app/domain/response/location_response.dart';
import 'package:weather/app/domain/response/weather_response.dart';
import 'package:weather/app/shared/constant/app_value.dart';
import 'package:weather/app/shared/core/base/baseviewmodel.dart';
import 'package:weather/app/shared/utils/utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:permission_handler/permission_handler.dart';

class SplashViewModel extends BaseViewModel {
  PreferenceManager preferenceManager;
  WeatherRepository weatherRepository;

  SplashViewModel(this.preferenceManager, this.weatherRepository);
  void init(void Function()goRouterFun)async{
    final ConnectivityResult connectivityResult=await(Connectivity().checkConnectivity());
    if(connectivityResult==ConnectivityResult.mobile || connectivityResult==ConnectivityResult.wifi){
     await getCurrentLocation();
      await getWeather();
    }
    else {
      Future.delayed(const Duration(milliseconds: 300));
    }
    goRouterFun();
  }


  Future<void> getWeather() async {
    //=====================================
    ///TODO GET CURRENT LOCATION FROM SHARED PREFS
    final String locationPrefs = await preferenceManager.getCurrentLocation();
    final LocationModel location;
    if (locationPrefs.isEmpty) {
      location = AppValues.defaultLocation;
    } else {
      location = LocationModel.fromJson(jsonDecode(locationPrefs));
    }
    //===================================
    ///TODO GET WEATHER FROM WEATHER REPO
    final WeatherRequest data = WeatherRequest(
        lat: location.latitude,
        lon: location.longitude,
        lang: getLanguageCode(),
        appid: AppValues.apiKey);
    final WeatherResponse? weather = await weatherRepository.getWeather(data);
    //===============================
    ///TODO SET WEATHER TO SHARED PREFS
    if (weather != null) {
      await preferenceManager.setLastWeather(jsonEncode(weather.toJson()));
    }
  }

  ///(TRUE, FALSE)]
  ///[check permission]
  ///[if app don't have permission request it]
  ///[change value of enabled if location permission is denied][from permission handler]
  ///[get current location from geolocator and accurecy]
  ///[translate latitude and longitude coordinates into an address]
  ///[save location in location instance]
  ///[weatherRepository.getLocation]
  ///[check locationResponse?.localNames]
  ///[set location in shared prefs]

  Future<void> getCurrentLocation() async {
    LocationModel? location;
    try {
      bool enabled;
      if (kIsWeb) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission != LocationPermission.always ||
            permission != LocationPermission.whileInUse) {
          permission = await Geolocator.requestPermission();
        }
        enabled = permission != LocationPermission.denied &&
            permission != LocationPermission.deniedForever;
      } else {
        enabled = await Permission.location.request().isGranted;
      }

      if (enabled) {
        final Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        final double latitude = position.latitude;
        final double longitude = position.longitude;
        if (!kIsWeb) {
          List<Placemark> placemarks = await placemarkFromCoordinates(
              latitude, longitude,
              localeIdentifier: getLanguageCode());
          if (placemarks.isNotEmpty) {
            location = LocationModel(
                country: placemarks[0].country ?? "",
                city: placemarks[0].locality ?? "",
                latitude: latitude,
                longitude: longitude);
          } else {
            location = LocationModel(
                country: '',
                city: '',
                latitude: latitude,
                longitude: longitude);
          }
        } else {
          final LocationResponse? locationResponse =
              await weatherRepository.getLocation(LocationRequest(
                  lat: latitude,
                  lon: longitude,
                  lang: getLanguageCode(),
                  limit: 1,
                  appid: AppValues.apiKey));
          if (locationResponse?.localNames != null) {
            location = LocationModel(
              country: '',
              city: _getCityByLang(locationResponse!.localNames!),
              latitude: latitude,
              longitude: longitude,
            );
          } else {
            location = LocationModel(
              country: '',
              city: '',
              latitude: latitude,
              longitude: longitude,
            );
          }
        }
      }
      if (location != null) {
        await preferenceManager
            .setCurrentLocation(jsonEncode(location.toJson()));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  _getCityByLang(LocalNames localNames) {
    switch (getLanguageCode()) {
      case AppValues.langCodeUk:
        return localNames.uk;
      default:
        return localNames.en;
    }
  }
}
