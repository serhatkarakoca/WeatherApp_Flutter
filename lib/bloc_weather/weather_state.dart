part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  final WeatherResponse weather;

  WeatherLoaded(this.weather);

  @override
  List<Object?> get props => [this.weather];
}

class WeatherErrorState extends WeatherState{

  @override
  List<Object?> get props =>[];

}