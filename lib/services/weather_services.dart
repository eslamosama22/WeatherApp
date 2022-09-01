import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/Weather_Model.dart';

class WeatherServices {
  Future<WeatherModel> getWeather({required String CityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String keyApi = '86f5f113cdd44281b6001916223008';
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$keyApi&q=$CityName&days=7&aqi=no&alerts=no');

    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);


    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;


  }
}
