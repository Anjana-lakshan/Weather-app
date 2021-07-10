import 'dart:convert';

class Coord {
  double lat;
  double lon;

  Coord.fromJson(Map<String, dynamic> json){
    this.lat = double.parse(json['lat'].toString());
    this.lon = double.parse(json['lon'].toString());
  }
}
