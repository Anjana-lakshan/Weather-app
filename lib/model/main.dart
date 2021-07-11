import 'dart:convert';

class Main {

  double temp;
  double feels;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int groundLevel;
  int humidity;

  Main.fromJson(Map<String, dynamic> json){
    this.temp = double.parse(json['temp'].toString());
    this.feels = double.parse(json['feels_like'].toString());
    this.tempMin = double.parse(json['temp_min'].toString());
    this.tempMax = double.parse(json['temp_max'].toString());

    this.pressure = int.parse(json['pressure'].toString());
    this.seaLevel = int.parse(json['sea_level'].toString());
    this.groundLevel = int.parse(json['grnd_level'].toString());
    this.humidity = int.parse(json['humidity'].toString());
  }
}
