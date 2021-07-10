import 'dart:convert';

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt(),
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Weather &&
      other.id == id &&
      other.main == main &&
      other.description == description &&
      other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      main.hashCode ^
      description.hashCode ^
      icon.hashCode;
  }
}