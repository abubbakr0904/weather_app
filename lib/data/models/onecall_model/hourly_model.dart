import 'package:weather_app/data/models/onecall_model/weatherly.dart';

class HourlyModel{
  final num dt;
  final num temp;
  final num feels_like;
  final num pressure;
  final num humidity;
  final num dew_point;
  final num uvi;
  final num clouds;
  final num visibility;
  final num wind_speed;
  final num wind_deg;
  final num wind_gust;
  final List<WeatherlyModel> weather;
  final num pop;

  HourlyModel(
      this.dt,
      this.temp,
      this.feels_like,
      this.pressure,
      this.humidity,
      this.dew_point,
      this.uvi,
      this.clouds,
      this.visibility,
      this.wind_speed,
      this.wind_deg,
      this.wind_gust,
      this.weather,
      this.pop,
      );

  factory HourlyModel.fromJson(Map<String , dynamic> json){
    return HourlyModel(
      json["dt"],
      json["temp"],
      json["feels_like"],
      json["pressure"],
      json["humidity"],
      json["dew_point"],
      json["uvi"],
      json["clouds"],
      json["visibility"],
      json["wind_speed"],
      json["wind_deg"],
      json["wind_gust"],
      (json["weather"] as List).map((e) => WeatherlyModel.fromJson(e)).toList() ?? [],
      json["pop"]
    );
  }

}