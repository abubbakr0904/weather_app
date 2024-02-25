

import '../../../models/simple_model/coord_model.dart';
import '../../../models/simple_model/main_model.dart';
import '../../../models/simple_model/sys_model.dart';
import '../../../models/simple_model/wind_model.dart';
import '../../both_models/in_weather_model.dart';

class WeatherM {
  WeatherM({
    required this.coordModel,
    required this.inWeather,
    required this.base,
    required this.mainModel,
    required this.visibility,
    required this.windModel,
    required this.clouds,
    required this.dt,
    required this.sysModel,
    required this.timeZone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final CoordModel coordModel;
  final List<InWeather> inWeather;
  final String base;
  final MainModel mainModel;
  final int visibility;
  final WindModel windModel;
  final int clouds;
  final int dt;
  final SysModel sysModel;
  final int timeZone;
  final int id;
  final String name;
  final int cod;

  factory WeatherM.fromJson(Map<String, dynamic> json) {
    return WeatherM(
      coordModel: CoordModel.fromJson(json["coord"]),
      inWeather: (json["weather"] as List?)
              ?.map((e) => InWeather.fromJson(e))
              .toList() ??
          [],
      base: json["base"] as String? ?? "",
      mainModel: MainModel.fromJson(json["main"]),
      visibility: json["visibility"] as int? ?? 0,
      windModel: WindModel.fromJson(json["wind"]),
      clouds: json["clouds"]["all"],
      dt: json["dt"] as int? ?? 0,
      sysModel: SysModel.fromJson(json["sys"]),
      timeZone: json["timezone"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      cod: json["cod"] as int? ?? 0,
    );
  }
}
