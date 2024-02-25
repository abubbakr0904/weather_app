class WeatherModelo{
  final num id;
  final String main;
  final String description;
  final String icon;

  WeatherModelo(this.id , this.main , this.description , this.icon);

  factory WeatherModelo.fromJson(Map<String , dynamic> json){
    return WeatherModelo(
      json["id"],
      json["main"],
      json["description"],
      json["icon"],
    );
  }

}