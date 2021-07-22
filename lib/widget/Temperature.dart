import 'package:block_weather/bloc_weather/weather_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final weather = (_weatherBloc.state as WeatherLoaded).weather;

    return BlocBuilder(
        bloc: _weatherBloc,
        builder: (context, WeatherState state) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Minimum Sıcaklık :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        weather.consolidatedWeather![0].minTemp!
                                .floor()
                                .toString() +
                            " °C",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Maksimum Sıcaklık :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        weather.consolidatedWeather![0].maxTemp!
                                .floor()
                                .toString() +
                            " °C",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
