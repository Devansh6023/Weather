import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:weather_app/Models.dart';

class getData {
  Future<WeatherResponse> getWeatherData(
      String latitude, String longitude) async {
    // final currentLocation = _getCurrentLocation();
    final inputData = {
      'lat': latitude,
      'lon': longitude,
      'appid': '6cfbce8d90da5850d4757308bf972c0f',
      'units': 'metric'
    };

    final uri =
        Uri.http('api.openweathermap.org', '/data/2.5/weather', inputData);

    final result = await https.get(uri);
    print(result.body);
    final json = jsonDecode(result.body);
    return WeatherResponse.fromJson(json);
  }
}
