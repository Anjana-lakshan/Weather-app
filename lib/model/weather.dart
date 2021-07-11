import 'dart:convert';

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather.fromJson(Map<String, dynamic> json){
    this.id = int.parse(json['id'].toString());
    this.main = json['main'];
    this.description = json['description'];
    this.icon = json['icon'];
  }
}
