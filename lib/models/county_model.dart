import 'dart:async';
import 'package:coronavirus_app/networking/networking.dart';

class CountyModel {
  String name = '';
  List<String> counties = [];

  CountyModel(this.name);

  Future<List<String>> setupCountyData() async {
    String data = await makeCountyCall();
    List<String> tempData = data.split('\n');
    tempData.remove(0);
    List<String> tempCountyData = [];
    Set<String> countySet = Set<String>();
    tempData.forEach((item) {
      String countiesTemp = item.split(',')[2];

      if (countiesTemp.contains(name)) {
        countySet.add(item.split(',')[1]);
        tempCountyData.add(item);
      }
    });
    counties = countySet.toList();
    return tempCountyData;
  }

  Future<String> makeCountyCall() async {
    NetworkHelper nh = NetworkHelper(
        'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv');
    return await nh.getData();
  }

  Future<CountyData> getNumbersFromData(String data) async {}
}

class CountyData {
  DateTime date = DateTime.now();
  List counties = [];
  String stateName = '';
  CountyData(this.counties, this.stateName);
}

class County {
  String name;
  String positiveCases;
  String deaths;
}
