import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_test/model/cityList.dart';
import 'package:practical_test/model/responseData.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  ResponseData responseData;
  String url = "http://api.openweathermap.org/data/2.5/group";

  @override
  void initState() {
    super.initState();
    _getData();
    Timer.periodic(Duration(minutes: 1), (Timer t) => _getData());
  }

  Future<void> _getData() async {
    String cityData = await getJson();
    CityList data = CityList.fromJson(cityData);
    //todo if data.list.length> 0
    List<String> cities = [];
    data.list.forEach((element) {
      cities.add(element.CityCode);
    });
    print('cities length ' + cities.length.toString());
    
    String s = cities.join(',');
    Map<String, String> queryParams = {
      'id': s,
      'units': 'metric',
      'appid': 'e939d8f958c3f03f834caeb710282dc6'
    };

    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = url + '?' + queryString;
    final response = await http.get(requestUrl);
    print('get data');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.statusCode);
      setState(() {
        responseData = ResponseData.fromJson(response.body);
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  Future<String> getJson() {
    return rootBundle.loadString('Step1.json');
  }

  @override
  Widget build(BuildContext context) {
    if (responseData != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Weather Data'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: responseData != null
                    ? Text(responseData.cnt.toString())
                    : Text('Loading'),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('Loading'),
            )
          ],
        ),
      ),
    );
  }
}
