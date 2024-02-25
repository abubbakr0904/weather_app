import 'package:weather_app/data/models/onecall_model/feellike_model.dart';
import 'package:weather_app/data/models/onecall_model/temp_model.dart';
import 'package:weather_app/data/models/onecall_model/weather_model.dart';

class DailyModel{
  final num dt;
  final num sunrise;
  final num sunset;
  final num moonrise;
  final num moonset;
  final num moon_phase;
  final TempModel temp;
  final FellLikeModel feels_like;
  final num pressure;
  final num humidity;
  final num dew_point;
  final num wind_speed;
  final num wind_deg;
  final num wind_gust;
  final List<WeatherModelo> weather;
  final num cloud;
  final num pop;
  final num rain;
  final num snow;
  final num uvi;

  DailyModel(
      this.dt,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moon_phase,
      this.temp,
      this.feels_like,
      this.pressure,
      this.humidity,
      this.dew_point,
      this.wind_speed,
      this.wind_deg,
      this.wind_gust,
      this.weather,
      this.cloud,
      this.pop,
      this.rain,
      this.snow,
      this.uvi
      );

  factory DailyModel.fromJson(Map<String , dynamic> json){
    return DailyModel(
      json["dt"],
      json["sunrise"],
      json["sunset"],
      json["moonrise"],
      json["moonset"],
      json["moon_phase"],
      TempModel.fromJson(json["temp"]),
      FellLikeModel.fromJson(json["feels_like"]),
      json["pressure"],
      json["humidity"],
      json["dew_point"],
      json["wind_speed"],
      json["wind_deg"],
      json["wind_gust"],
      (json["weather"] as List).map((e) => WeatherModelo.fromJson(e)).toList() ?? [],
      json["clouds"],
      json["pop"],
      json["rain"],
      json["snow"],
      json["uvi"],

    );
  }

}