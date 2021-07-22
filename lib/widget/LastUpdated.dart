import 'package:block_weather/bloc_weather/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastUpdatedWidget extends StatelessWidget {
  const LastUpdatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final weather = (_weatherBloc.state as WeatherLoaded).weather;
    var date = DateTime.parse(weather.time!).toLocal();

    return BlocBuilder(
        bloc: _weatherBloc,
        builder: (context, WeatherState state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                   weather.consolidatedWeather![0].theTemp!.floor().toString()+" °C",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,color: Colors.blue ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Son Güncelleme " + TimeOfDay.fromDateTime(date).format(context),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          );
        });
  }
}
