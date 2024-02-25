class MainModel{
  final double temp;
  final double feelLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainModel(this.temp , this.feelLike , this.tempMin ,this.tempMax , this.pressure , this.humidity);

  factory MainModel.fromJson(Map<String , dynamic> json){
    return MainModel(
      json["temp"],
      json["feels_like"],
      json["temp_min"],
      json["temp_max"],
      json["pressure"],
      json["humidity"],
    );
  }

}