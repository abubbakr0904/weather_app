class CloudModel{
  final int all;

  CloudModel(this.all);

  factory CloudModel.fromJson(Map<String  , dynamic> json){
    return CloudModel(
      json["all"],
    );
  }
}