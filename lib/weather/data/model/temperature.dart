final class Temperature {
  final double? minimum;
  final double? maximum;
  final double? dayTime;
  final double? nightTime;
  final double? evening;
  final double? morning;

  Temperature({
    this.minimum,
    this.maximum,
    this.dayTime,
    this.nightTime,
    this.evening,
    this.morning,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      minimum: double.tryParse(json['minimum'].toString()),
      maximum: double.tryParse(json['maximum'].toString()),
      dayTime: double.tryParse(json['daytime'].toString()),
      nightTime: double.tryParse(json['nighttime'].toString()),
      evening: double.tryParse(json['evening'].toString()),
      morning: double.tryParse(json['morning'].toString()),
    );
  }
}
