import 'dart:convert';

class City {
  final String CityCode;
  final String CityName;
  final String Temp;
  final String Status;
  City({
    this.CityCode,
    this.CityName,
    this.Temp,
    this.Status,
  });

  Map<String, dynamic> toMap() {
    return {
      'CityCode': CityCode,
      'CityName': CityName,
      'Temp': Temp,
      'Status': Status,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      CityCode: map['CityCode'],
      CityName: map['CityName'],
      Temp: map['Temp'],
      Status: map['Status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));

  @override
  String toString() {
    return 'City(CityCode: $CityCode, CityName: $CityName, Temp: $Temp, Status: $Status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is City &&
      other.CityCode == CityCode &&
      other.CityName == CityName &&
      other.Temp == Temp &&
      other.Status == Status;
  }

  @override
  int get hashCode {
    return CityCode.hashCode ^
      CityName.hashCode ^
      Temp.hashCode ^
      Status.hashCode;
  }
}