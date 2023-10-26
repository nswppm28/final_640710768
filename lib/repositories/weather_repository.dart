import 'dart:convert';

import 'package:final_640710768/models/weather.dart';

import '../services/api_caller.dart';

class WeatherRepository {
  Future<List< weather>> getWeather() async {
    try {
      var result = await ApiCaller().get('weather?_embed=reviews');
      List<Map<String, dynamic>> list = jsonDecode(result);
      List<weather> weatherList = list
          .map((item) => weather.fromJson(item))
          .toList();
      return weatherList;
    } catch (e) {
      rethrow;
    }
  }
}
  Future<void> Weather(
      {required double tempC, required double tempF}) async {
    try {
      var result = await ApiCaller()
          .post('Weather', params: {'tempC': tempC, 'tempF': tempF});
    } catch (e) {
      // TODO:
      rethrow;
    }
  }

