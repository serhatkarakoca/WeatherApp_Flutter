import 'package:block_weather/di/app_module.dart';
import 'package:block_weather/model/Weather/weather_response.dart';
import 'package:block_weather/service/api_client.dart';

class WeatherRepository {
  ApiClient apiClient = locator<ApiClient>();

  Future<WeatherResponse> getWeather(String city) async {
   final int cityID = await apiClient.getLocationID(city);

    return await apiClient.getWeather(cityID);
  }
}

