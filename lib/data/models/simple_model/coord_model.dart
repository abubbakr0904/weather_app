class CoordModel{
  final double lon;
  final double lat;

  CoordModel(this.lon , this.lat);

  factory CoordModel.fromJson(Map<String , dynamic> json){
    return CoordModel(
      json["lon"],
      json["lat"],
    );
  }
}