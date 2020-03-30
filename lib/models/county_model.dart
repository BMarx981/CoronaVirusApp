import 'dart:async';
import 'package:coronavirus_app/networking/networking.dart';

class CountyModel {
  String name = '';
  List<String> counties = [];

  CountyModel(this.name);

  Future<Map<String, CountyData>> setupCountyData() async {
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

    return _getNumbersFromData(tempCountyData, counties);
  }

  Future<String> makeCountyCall() async {
    NetworkHelper nh = NetworkHelper(
        'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv');
    return await nh.getData();
  }

  Future<Map<String, CountyData>> _getNumbersFromData(
      List<String> countyData, List<String> counties) async {
    Map<String, CountyData> countyMap = Map<String, CountyData>();
    countyData.forEach((item) {
      List tempDateList = item.split('-');
      DateTime date = DateTime(
        int.parse(tempDateList[0]),
        int.parse(tempDateList[1]),
        int.parse(tempDateList[2]),
      );
      String county = item.split(',')[1];
      int posCases = int.parse(item.split(',')[3]);
      int deaths = int.parse(item.split(',')[4]);
      countyMap[county] = CountyData(date, county, posCases, deaths);
    });
    return countyMap;
  }
}

class CountyData {
  DateTime date = DateTime.now();
  String name;
  int posCases;
  int deaths;

  CountyData(this.date, this.name, this.posCases, this.deaths);
}

class County {
  String name;
  String positiveCases;
  String deaths;
}
