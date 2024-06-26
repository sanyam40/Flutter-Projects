import 'package:weatherapp/model/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'fb7005519c26e53194837d52e9bad3bd';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameter = {'q': location, 'appId': apiKey};

    Uri uri = Uri.https(authority, path, parameter);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weatherData = Weather.fromJson(data);
    return weatherData;
  }
}
