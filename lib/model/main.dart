import 'dart:convert';

class Main {
  final double temp;
  final int pressure;
  final int humidity;
  final int temp_min;
  final int temp_max;
  Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.temp_min,
    this.temp_max,
  });

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
      'temp_min': temp_min,
      'temp_max': temp_max,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp']?.toDouble(),
      pressure: map['pressure']?.toInt(),
      humidity: map['humidity']?.toInt(),
      temp_min: map['temp_min']?.toInt(),
      temp_max: map['temp_max']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Main(temp: $temp, pressure: $pressure, humidity: $humidity, temp_min: $temp_min, temp_max: $temp_max)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Main &&
      other.temp == temp &&
      other.pressure == pressure &&
      other.humidity == humidity &&
      other.temp_min == temp_min &&
      other.temp_max == temp_max;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
      pressure.hashCode ^
      humidity.hashCode ^
      temp_min.hashCode ^
      temp_max.hashCode;
  }
}