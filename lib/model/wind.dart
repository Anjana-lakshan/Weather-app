import 'dart:convert';

class Wind {
  double speed;
  int deg;

  Wind.fromJson(Map<String, dynamic> json){
    this.speed = double.parse(json['speed'].toString());
    this.deg = int.parse(json['deg'].toString());
  }
}
