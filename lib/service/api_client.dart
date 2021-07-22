import 'package:block_weather/model/Weather/weather_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  static const BASE_URL = "www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String query) async {

    var url = Uri.https(BASE_URL, "/api/location/search/", {
      'query': '$query'
    });
    debugPrint(url.toString());
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Veri getirilemedi");
    }

    final responseJSON = jsonDecode(response.body) as List;
    debugPrint(responseJSON[0]["woeid"].toString());
    return responseJSON[0]["woeid"];
  }

  Future<WeatherResponse> getWeather(int locationID) async {
    var url = Uri.https(BASE_URL, "/api/location/$locationID");
    final response = await http.get(url);
    debugPrint(url.toString());
    if (response.statusCode != 200) {
      throw Exception("veri yok");
    }

    final responseJSON = jsonDecode(response.body);
    return WeatherResponse.fromJson(responseJSON);
  }
}
