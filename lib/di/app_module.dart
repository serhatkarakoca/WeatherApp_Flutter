
import 'package:block_weather/repo/weather_repository.dart';
import 'package:block_weather/service/api_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void appModule(){
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => ApiClient());
}