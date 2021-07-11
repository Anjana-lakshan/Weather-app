import 'package:flutter/cupertino.dart';
import 'package:practical_test/model/clouds.dart';
import 'package:practical_test/model/coord.dart';
import 'package:practical_test/model/main.dart';
import 'package:practical_test/model/sys.dart';
import 'package:practical_test/model/weather.dart';
import 'package:practical_test/model/wind.dart';

class WeatherData{
  int id;
  int dt;
  String name;
  int visibility;

  Coord coord;
  Sys sys;
  Weather weather;
  Main main;
  Wind wind;
  Clouds clouds;

  WeatherData.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.dt = json['dt'];
    this.name = json['name'];
    this.visibility = json['visibility'];

    this.coord = new Coord.fromJson(json['coord']);
    this.sys = new Sys.fromJson(json['sys']);
    this.weather = new Weather.fromJson(json['weather'][0]);
    this.main = new Main.fromJson(json['main']);
    this.wind = new Wind.fromJson(json['wind']);
    this.clouds = new Clouds.fromJson(json['clouds']);
  }
}
