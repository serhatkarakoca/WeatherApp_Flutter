import 'dart:convert';

import 'package:flutter/material.dart';

WeatherResponse weatherResponseFromJson(String str) => WeatherResponse.fromJson(json.decode(str));

String weatherResponseToJson(WeatherResponse data) => json.encode(data.toJson());

class WeatherResponse {
  WeatherResponse({
    this.consolidatedWeather,
    this.time,
    this.sunRise,
    this.sunSet,
    this.timezoneName,
    this.parent,
    this.sources,
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
    this.timezone,
  });

  List<ConsolidatedWeather>? consolidatedWeather;
  String? time;
  String? sunRise;
  String? sunSet;
  String? timezoneName;
  Parent? parent;
  List<Source>? sources;
  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;
  String? timezone;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
    consolidatedWeather: json["consolidated_weather"] == null ? null : List<ConsolidatedWeather>.from(json["consolidated_weather"].map((x) => ConsolidatedWeather.fromJson(x))),
    time: json["time"] == null ? null : json["time"],
    sunRise: json["sun_rise"] == null ? null : json["sun_rise"],
    sunSet: json["sun_set"] == null ? null :json["sun_set"],
    timezoneName: json["timezone_name"] == null ? null : json["timezone_name"],
    parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
    sources: json["sources"] == null ? null : List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
    title: json["title"] == null ? null : json["title"],
    locationType: json["location_type"] == null ? null : json["location_type"],
    woeid: json["woeid"] == null ? null : checkInt(json["woeid"]),
    lattLong: json["latt_long"] == null ? null : json["latt_long"],
    timezone: json["timezone"] == null ? null : json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "consolidated_weather": consolidatedWeather == null ? null : List<dynamic>.from(consolidatedWeather!.map((x) => x.toJson())),
    "time": time == null ? null : time,
    "sun_rise": sunRise == null ? null : sunRise,
    "sun_set": sunSet == null ? null : sunSet,
    "timezone_name": timezoneName == null ? null : timezoneName,
    "parent": parent == null ? null : parent!.toJson(),
    "sources": sources == null ? null : List<dynamic>.from(sources!.map((x) => x.toJson())),
    "title": title == null ? null : title,
    "location_type": locationType == null ? null : locationType,
    "woeid": woeid == null ? null : woeid,
    "latt_long": lattLong == null ? null : lattLong,
    "timezone": timezone == null ? null : timezone,
  };
}

class ConsolidatedWeather {
  ConsolidatedWeather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  int? id;
  String? weatherStateName;
  String? weatherStateAbbr;
  String? windDirectionCompass;
  String? created;
  String? applicableDate;
  double? minTemp;
  double? maxTemp;
  double? theTemp;
  double? windSpeed;
  double? windDirection;
  int? airPressure;
  int? humidity;
  double? visibility;
  int? predictability;

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) => ConsolidatedWeather(
    id: json["id"] == null ? null : (json["id"]),
    weatherStateName: json["weather_state_name"] == null ? null : json["weather_state_name"],
    weatherStateAbbr: json["weather_state_abbr"] == null ? null : json["weather_state_abbr"],
    windDirectionCompass: json["wind_direction_compass"] == null ? null : json["wind_direction_compass"],
    created: json["created"] == null ? null : json["created"],
    applicableDate: json["applicable_date"] == null ? null : json["applicable_date"],
    minTemp: json["min_temp"] == null ? null : checkDouble(json["min_temp"]),
    maxTemp: json["max_temp"] == null ? null : checkDouble(json["max_temp"]),
    theTemp: json["the_temp"] == null ? null : checkDouble(json["the_temp"]),
    windSpeed: json["wind_speed"] == null ? null :checkDouble(json["wind_speed"]),
    windDirection: json["wind_direction"] == null ? null : checkDouble(json["wind_direction"]),
    airPressure: json["air_pressure"] == null ? null : checkInt(json["air_pressure"]),
    humidity: json["humidity"] == null ? null : checkInt(json["humidity"]),
    visibility: json["visibility"] == null ? null : checkDouble(json["visibility"]),
    predictability: json["predictability"] == null ? null : checkInt(json["predictability"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "weather_state_name": weatherStateName == null ? null : weatherStateName,
    "weather_state_abbr": weatherStateAbbr == null ? null : weatherStateAbbr,
    "wind_direction_compass": windDirectionCompass == null ? null : windDirectionCompass,
    "created": created == null ? null : created,
    "applicable_date": applicableDate == null ? null : applicableDate.toString(),
    "min_temp": minTemp == null ? null : minTemp,
    "max_temp": maxTemp == null ? null : maxTemp,
    "the_temp": theTemp == null ? null : theTemp,
    "wind_speed": windSpeed == null ? null : windSpeed,
    "wind_direction": windDirection == null ? null : windDirection,
    "air_pressure": airPressure == null ? null : airPressure,
    "humidity": humidity == null ? null : humidity,
    "visibility": visibility == null ? null : visibility,
    "predictability": predictability == null ? null : predictability,
  };
}

class Parent {
  Parent({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    title: json["title"] == null ? null : json["title"],
    locationType: json["location_type"] == null ? null : json["location_type"],
    woeid: json["woeid"] == null ? null : checkInt(json["woeid"]),
    lattLong: json["latt_long"] == null ? null : json["latt_long"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "location_type": locationType == null ? null : locationType,
    "woeid": woeid == null ? null : woeid,
    "latt_long": lattLong == null ? null : lattLong,
  };
}

class Source {
  Source({
    this.title,
    this.slug,
    this.url,
    this.crawlRate,
  });

  String? title;
  String? slug;
  String? url;
  int? crawlRate;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    url: json["url"] == null ? null : json["url"],
    crawlRate: json["crawl_rate"] == null ? null :checkInt(json["crawl_rate"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "url": url == null ? null : url,
    "crawl_rate": crawlRate == null ? null : crawlRate,
  };

}
double checkDouble(dynamic value) {
if (value is String || value is int) {
return double.parse(value);
} else {
return value;
}
}
int checkInt(dynamic value){
  if(value is double){
    return value.toInt();
  }
  else{
    return value;
  }
}
