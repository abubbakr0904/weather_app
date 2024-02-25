import 'package:weather_app/data/models/simple_model/cloud_model.dart';
import 'package:weather_app/data/models/simple_model/coord_model.dart';
import 'package:weather_app/data/models/simple_model/main_model.dart';
import 'package:weather_app/data/models/simple_model/sys_model.dart';
import 'package:weather_app/data/models/simple_model/weather_model.dart';
import 'package:weather_app/data/models/simple_model/wind_model.dart';

class DataModel{
  final CoordModel coord;
  final List<WeatherModel> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final CloudModel cloud;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  DataModel(
      this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.cloud,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod
      );
  factory DataModel.fromJson(Map<String , dynamic> json){
    return DataModel(
      CoordModel.fromJson(json["coord"]),
      (json["weather"] as List?)?.map((e) => WeatherModel.fromJson(e)).toList() ?? [],
      json["base"],
      MainModel.fromJson(json["main"]),
      json["visibility"],
      WindModel.fromJson(json["wind"]),
      CloudModel.fromJson(json["clouds"]),
      json["dt"],
      SysModel.fromJson(json["sys"]),
      json["timezone"],
      json["id"],
      json["name"],
      json["cod"],


    );
  }
}