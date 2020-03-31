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
  Map<String, CountyData> data;
  CountyModel cm;
  List<String> counties = [];

  initState() {
    super.initState();
    name = widget.name;
    cm = CountyModel(name);
    setup();
  }

  setup() async {
    data = await cm.setupCountyData();
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
        color: Colors.purple[200],
        child: ListView.builder(
          itemCount: counties.length,
          itemBuilder: (context, index) {
            return countyBuilder(counties[index]);
          },
        ),
      ),
    );
  }

  Widget countyBuilder(String name) {
    CountyData cData = data[name];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                'Positive Cases: ${cData.posCases}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                'Deaths: ${cData.deaths}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
