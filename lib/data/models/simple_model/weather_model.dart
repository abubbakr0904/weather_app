class WeatherModel{
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel(this.id , this.main , this.description , this.icon);

  factory WeatherModel.fromJson(Map<String , dynamic> json){
    return WeatherModel(
      json["id"],
      json["main"],
      json["description"],
      json["icon"],
    );
  }
}