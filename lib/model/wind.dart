import 'dart:convert';

class Wind {
  final int speed;
  final int deg;
  Wind({
    this.speed,
    this.deg,
  });

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed']?.toInt(),
      deg: map['deg']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Wind &&
      other.speed == speed &&
      other.deg == deg;
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode;
}