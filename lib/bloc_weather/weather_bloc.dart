import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_weather/di/app_module.dart';
import 'package:block_weather/model/Weather/weather_response.dart';
import 'package:block_weather/repo/weather_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository repository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeatherEvent){
      yield WeatherLoading();
      try{
        final WeatherResponse weatherResponse = await repository.getWeather(event.cityName);
        yield WeatherLoaded(weatherResponse);
      }catch(e){
        debugPrint(e.toString());
        yield WeatherErrorState();
      }
    }
    else if(event is RefreshWeatherEvent){
        try{
          final WeatherResponse weatherResponse = await repository.getWeather(event.cityName);
          yield WeatherLoaded(weatherResponse);
        }catch(e){
          debugPrint(e.toString());
          yield state;
        }

    }
  }
}
