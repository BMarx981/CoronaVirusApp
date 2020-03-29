import 'package:flutter/material.dart';
import 'networking/networking.dart';
import 'models/county_model.dart';

class CountyScreen extends StatefulWidget {
  String name;

  CountyScreen(this.name);
  @override
  _CountyScreenState createState() => _CountyScreenState();
}

class _CountyScreenState extends State<CountyScreen> {
  String name;
  String countyData;
  CountyModel cm;

  initState() {
    super.initState();
    name = widget.name;
  }

  makeCountyCall() async {
    NetworkHelper nh = NetworkHelper(
        'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv');
    countyData = await nh.getData();
    cm = CountyModel(
      countyData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoronaVirus data by County'),
      ),
      body: Container(
        child: Text('Counties'),
      ),
    );
  }
}
