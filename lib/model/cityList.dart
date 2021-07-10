import 'dart:convert';
import 'dart:core';

import 'package:collection/collection.dart';
import 'package:practical_test/model/city.dart';

class CityList {
  final List<City> list;
  CityList({
    this.list,
  });

  Map<String, dynamic> toMap() {
    return {
      'List': list,
    };
  }

  factory CityList.fromMap(Map<String, dynamic> map) {
    return CityList(
      list: List<City>.from(map['List']?.map((x) => City.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CityList.fromJson(String source) =>
      CityList.fromMap(json.decode(source));

  List<String> getCityList() {
    List<String> cityList = [];
    list.map((e) {
      print(e.CityCode);
      cityList.add(e.CityCode);
    });
    return cityList;
  }

  @override
  String toString() => 'CityList(List: $List)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is CityList && listEquals(other.list, list);
  }

  @override
  int get hashCode => list.hashCode;
}
