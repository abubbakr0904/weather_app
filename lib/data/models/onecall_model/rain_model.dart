class RainModel{
  final num h;

  RainModel(this.h);
  factory RainModel.fromJson(Map<String , dynamic> json){
    return RainModel(
      json["1h"]
    );
  }

}