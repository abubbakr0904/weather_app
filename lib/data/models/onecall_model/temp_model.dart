class TempModel{
  final num day;
  final num min;
  final num max;
  final num night;
  final num eve;
  final num morn;

  TempModel(this.day , this.min , this.max , this.night , this.eve , this.morn);

  factory TempModel.fromJson(Map<String , dynamic> json){
    return TempModel(
      json["day"],
      json["min"],
      json["max"],
      json["night"],
      json["eve"],
      json["morn"],
    );
  }
}