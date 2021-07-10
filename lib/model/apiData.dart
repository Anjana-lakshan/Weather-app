import 'dart:convert';

import 'package:collection/collection.dart';

import 'clouds.dart';
import 'coord.dart';
import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class ApiData {
  final Coord coord;
  final Sys sys;
  final List<Weather> weather;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final int id;
  final String name;
  ApiData({
    this.coord,
    this.sys,
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.id,
    this.name,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'coord': coord.toMap(),
      'sys': sys.toMap(),
      'weather': weather?.map((x) => x.toMap())?.toList(),
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'clouds': clouds.toMap(),
      'dt': dt,
      'id': id,
      'name': name,
    };
  }

  factory ApiData.fromMap(Map<String, dynamic> map) {
    return ApiData(
      coord: Coord.fromMap(map['coord']),
      sys: Sys.fromMap(map['sys']),
      weather: List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
      main: Main.fromMap(map['main']),
      visibility: map['visibility']?.toInt(),
      wind: Wind.fromMap(map['wind']),
      clouds: Clouds.fromMap(map['clouds']),
      dt: map['dt']?.toInt(),
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiData.fromJson(String source) => ApiData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ApiData(coord: $coord, sys: $sys, weather: $weather, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is ApiData &&
      other.coord == coord &&
      other.sys == sys &&
      listEquals(other.weather, weather) &&
      other.main == main &&
      other.visibility == visibility &&
      other.wind == wind &&
      other.clouds == clouds &&
      other.dt == dt &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
      sys.hashCode ^
      weather.hashCode ^
      main.hashCode ^
      visibility.hashCode ^
      wind.hashCode ^
      clouds.hashCode ^
      dt.hashCode ^
      id.hashCode ^
      name.hashCode;
  }
}