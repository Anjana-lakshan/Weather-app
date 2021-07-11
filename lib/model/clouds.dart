import 'dart:convert';

class Clouds {
  int all;
  Clouds.fromJson(Map<String, dynamic> json){
    this.all = int.parse(json['all'].toString());
  }
}
