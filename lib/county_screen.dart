import 'package:flutter/material.dart';
import 'networking/networking.dart';
import 'models/county_model.dart';

class CountyScreen extends StatefulWidget {
  String name;
  Map<String, CountyData> data;

  CountyScreen(this.name);
  @override
  _CountyScreenState createState() => _CountyScreenState();
}

class _CountyScreenState extends State<CountyScreen> {
  String name;
  String countyData;
  CountyModel cm;
  List<String> counties = [];

  initState() {
    super.initState();
    name = widget.name;
    cm = CountyModel(name);
    setup();
  }

  setup() async {
    widget.data = await cm.setupCountyData();
    await print(widget.data);
    setState(() {
      counties = cm.counties;
      counties.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name counties'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: counties.length,
          itemBuilder: (context, index) {
            return countyBuilder(index);
          },
        ),
      ),
    );
  }

  Widget countyBuilder(int index) {
    return Container(child: Text(counties[index]));
  }
}
