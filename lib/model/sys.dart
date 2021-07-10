import 'dart:convert';

class Sys {
  final int type;
  final int id;
  final double message;
  final String country;
  final int sunrise;
  final int sunset;
  Sys({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
      'message': message,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      type: map['type']?.toInt(),
      id: map['id']?.toInt(),
      message: map['message']?.toDouble(),
      country: map['country'],
      sunrise: map['sunrise']?.toInt(),
      sunset: map['sunset']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) => Sys.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sys(type: $type, id: $id, message: $message, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Sys &&
      other.type == type &&
      other.id == id &&
      other.message == message &&
      other.country == country &&
      other.sunrise == sunrise &&
      other.sunset == sunset;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      id.hashCode ^
      message.hashCode ^
      country.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode;
  }
}