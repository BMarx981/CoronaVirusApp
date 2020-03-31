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
      List spList = item.split(',');
      DateTime date = getDateTime(spList[0]);
      String county = item.split(',')[1];
      int posCases = int.parse(item.split(',')[4]);
      int deaths = int.parse(item.split(',')[5]);
      countyMap[county] = CountyData(county, date, posCases, deaths);
    });
    countyMap.keys.forEach((county) {
      DateTime lastDate = countyMap[county].date;
      DateTime sevenDaysAgo = lastDate.subtract(Duration(days: 7));
      for (var i = countyData.length - 1; i > 0; i--) {
        List splitData = countyData[i].split(',');
        if (splitData[1] == county &&
            getDateTime(splitData[0]) == sevenDaysAgo) {
          countyMap[county].deathPercent = calculatePercentage(
              countyMap[county].deaths, int.parse(splitData[5]));
          countyMap[county].posPercent = calculatePercentage(
              countyMap[county].posCases, int.parse(splitData[4]));
          print('${countyMap[county].posPercent}% Positive cases');
        }
      }
    });
    return countyMap;
  }

  int calculatePercentage(int current, int last) {
    print('$current: current');
    print('$last: Last');
    if (current == 0) {
      return 0;
    }
    if (last == 0 && current > 0) {
      return current * 100;
    }
    int subtract = current - last;
    return ((subtract / current) * 100).round();
  }

  DateTime getDateTime(String origInfo) {
    List tempString = origInfo.split('-');
    return DateTime(
      int.parse(tempString[0]),
      int.parse(tempString[1]),
      int.parse(tempString[2]),
    );
  }
}

class CountyData {
  DateTime date = DateTime.now();
  String name;
  int posCases;
  int deaths;
  int posPercent;
  int deathPercent;

  CountyData(this.name,
      [this.date,
      this.posCases,
      this.deaths,
      this.posPercent,
      this.deathPercent]);

  @override
  String toString() {
    return 'Date: $date, Name: $name, Positive Cases: $posCases, Deaths: $deaths';
  }
}
