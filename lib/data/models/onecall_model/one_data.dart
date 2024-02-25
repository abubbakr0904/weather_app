import 'package:weather_app/data/models/onecall_model/daily_model.dart';
import 'package:weather_app/data/models/onecall_model/hourly_model.dart';

class OneCall{
  final num lat;
  final num lot;
  final String timezone;
  final num offset;
  final List<HourlyModel> hourly;
  final List<DailyModel> daily;

  OneCall(
      this.lat,
      this.lot,
      this.timezone,
      this.offset,
      this.hourly,
      this.daily
      );
  factory OneCall.fromJson(Map<String , dynamic> json){
    return OneCall(
      json["lat"] ?? 0.0,
      json["lon"] ?? 0.0,
      json["timezone"] ?? "",
      json["timezone_offset"] ?? 0,
      (json["hourly"] as List).map((e) => HourlyModel.fromJson(e)).toList() ?? [],
      (json["daily"] as List).map((e) => DailyModel.fromJson(e)).toList() ?? [],

    );
  }

}