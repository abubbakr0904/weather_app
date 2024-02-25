class WindModel {
  final dynamic speed;
  final int deg;

  WindModel(this.speed, this.deg);

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      json["speed"],
      json["deg"],
    );
  }
}
