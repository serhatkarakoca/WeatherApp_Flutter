import 'package:block_weather/bloc_weather/weather_bloc.dart';
import 'package:block_weather/service/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final weather = (_weatherBloc.state as WeatherLoaded).weather;
    var url = "https://"+ApiClient.BASE_URL+"/static/img/weather/png/"+weather.consolidatedWeather![0].weatherStateAbbr.toString()+".png";
    return Image.network(url,width: 100,height: 100,);
  }
}
