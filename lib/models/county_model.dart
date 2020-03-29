import 'dart:async';
import 'package:coronavirus_app/networking/networking.dart';

class CountyModel {
  List<String> stateNames = [];
  String name = '';

  CountyModel(this.stateNames, this.name);

  Future<String> makeCountyCall() async {
    NetworkHelper nh = NetworkHelper(
        'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv');
    return await nh.getData();
  }

  Future<CountyData> getNumbersFromData(String data) {}
}

class CountyData {
  List counties = [];
  String stateName;
}

class County {
  String name;
  String positiveCases;
  String deaths;
}
