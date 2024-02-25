class WeatherlyModel{
  final num id;
  final String main;
  final String description;
  final String icon;

  WeatherlyModel(this.id , this.main , this.description , this.icon);

  factory WeatherlyModel.fromJson(Map<String , dynamic> json){
    return WeatherlyModel(
      json["id"],
      json["main"],
      json["description"],-
      json["icon"],
    );
  }
}