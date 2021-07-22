import 'dart:async';

import 'package:block_weather/bloc_weather/weather_bloc.dart';
import 'package:block_weather/widget/WeatherImage.dart';
import 'package:block_weather/widget/select_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'LastUpdated.dart';
import 'Location.dart';
import 'Temperature.dart';

class MyHomePage extends StatelessWidget {
  String selectedCity = "Ankara";
  Completer<void> _refresh = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () async {
              selectedCity = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectCityWidget()));

              if (selectedCity.isNotEmpty) {
                _weatherBloc.add(FetchWeatherEvent(cityName: selectedCity));
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder(
            bloc: _weatherBloc,
            builder: (context, WeatherState state){
          if (state is WeatherInitial) {
            return Center(child: Text("Şehir Seçiniz !"));
          }
          if (state is WeatherLoaded) {
            final weatherInfo = state.weather;
            _refresh.complete();
            _refresh = Completer<void>();

            return RefreshIndicator(
              onRefresh: (){
              _weatherBloc.add(RefreshWeatherEvent(cityName: selectedCity));
                return _refresh.future;
              },
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                        child: LocationWidget(
                      selectedLocation: weatherInfo.title!,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: LastUpdatedWidget()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: WeatherImageWidget()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: TemperatureWidget()),
                  ),
                ],
              ),
            );
          }
          if(state is WeatherErrorState){
            return Center(
              child: Text("Error"),
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
