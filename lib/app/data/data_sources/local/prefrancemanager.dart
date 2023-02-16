import 'package:shared_preferences/shared_preferences.dart';


class PreferenceManager {
  static const String _currentLocation = '_currentLocation';
  static const String _lastWeather = '_lastWeather';

  Future<bool> setCurrentLocation(String? e) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_currentLocation, e ?? '');
  }

  Future<String> getCurrentLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currentLocation) ?? '';
  }

  Future<bool> setLastWeather(String? e) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_lastWeather, e ?? '');
  }

  Future<String> getLastWeather() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastWeather) ?? '';
  }

  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
