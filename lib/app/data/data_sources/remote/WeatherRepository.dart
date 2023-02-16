import 'package:weather/app/domain/response/location_response.dart';
import 'package:weather/app/domain/response/weather_response.dart';

import '../../../domain/requests/location_requests.dart';
import '../../../domain/requests/weather_request.dart';


abstract class WeatherRepository {
 Future<WeatherResponse?> getWeather(final WeatherRequest data);

 Future<LocationResponse?> getLocation(final LocationRequest data);
}

