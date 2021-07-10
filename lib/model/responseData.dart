import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:practical_test/model/apiData.dart';

class ResponseData {
  final int cnt;
  final List<ApiData> list;
  //final String city;
  ResponseData({
    this.cnt,
    this.list,
    //this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'cnt': cnt,
      'list': list,
    };
  }

  factory ResponseData.fromMap(Map<String, dynamic> map) {
    return ResponseData(
      cnt: map['cnt']?.toInt(),
      list: List<ApiData>.from(map['list']?.map((x) => ApiData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseData.fromJson(String source) =>
      ResponseData.fromMap(json.decode(source));

  @override
  String toString() => 'ResponseData(cnt: $cnt, list: $list)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ResponseData &&
        other.cnt == cnt &&
        listEquals(other.list, list);
  }

  @override
  int get hashCode => cnt.hashCode ^ list.hashCode;
}
