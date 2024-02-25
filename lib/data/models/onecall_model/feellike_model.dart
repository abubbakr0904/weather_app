class FellLikeModel{
  final num day;
  final num night;
  final num eve;
  final num morn;

  FellLikeModel(this.day ,this.night , this.eve , this.morn);

  factory FellLikeModel.fromJson(Map<String , dynamic> json){
    return FellLikeModel(
      json["day"],
      json["night"],
      json["eve"],
      json["morn"],
    );
  }
}