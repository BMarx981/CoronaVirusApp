import 'package:flutter/material.dart';
import 'networking/networking.dart';
import 'models/county_model.dart';

const Map states = {
  'Alabama': 'http://www.state-flags-usa.com/flags/alabama.jpg',
  'Alaska': 'http://www.state-flags-usa.com/flags/alaska.jpg',
  'Arizona': 'http://www.state-flags-usa.com/flags/arizona.jpg',
  'Arkansas': 'http://www.state-flags-usa.com/flags/arkansas.jpg',
  'California': 'http://www.state-flags-usa.com/flags/california.jpg',
  'Colorado': 'http://www.state-flags-usa.com/flags/colorado.jpg',
  'Connecticut': 'http://www.state-flags-usa.com/flags/connecticut.jpg',
  'Delaware': 'http://www.state-flags-usa.com/flags/delaware.jpg',
  'Florida': 'http://www.state-flags-usa.com/flags/florida.jpg',
  'Georgia': 'http://www.state-flags-usa.com/flags/georgia.jpg',
  'Hawaii': 'http://www.state-flags-usa.com/flags/hawaii.jpg',
  'Idaho': 'http://www.state-flags-usa.com/flags/idaho.jpg',
  'Illinois': 'http://www.state-flags-usa.com/flags/illinois.jpg',
  'Indiana': 'http://www.state-flags-usa.com/flags/indiana.jpg',
  'Iowa': 'http://www.state-flags-usa.com/flags/iowa.jpg',
  'Kansas': 'http://www.state-flags-usa.com/flags/kansas.jpg',
  'Kentucky': 'http://www.state-flags-usa.com/flags/kentucky.jpg',
  'Louisiana': 'http://www.state-flags-usa.com/flags/louisiana.jpg',
  'Maine': 'http://www.state-flags-usa.com/flags/maine.jpg',
  'Maryland': 'http://www.state-flags-usa.com/flags/maryland.jpg',
  'Massachusetts': 'http://www.state-flags-usa.com/flags/massachusetts.jpg',
  'Michigan': 'http://www.state-flags-usa.com/flags/michigan.jpg',
  'Minnesota': 'http://www.state-flags-usa.com/flags/minnesota.jpg',
  'Mississippi': 'http://www.state-flags-usa.com/flags/mississippi.jpg',
  'Missouri': 'http://www.state-flags-usa.com/flags/missouri.jpg',
  'Montana': 'http://www.state-flags-usa.com/flags/montana.jpg',
  'Nebraska': 'http://www.state-flags-usa.com/flags/nebraska.jpg',
  'Nevada': 'http://www.state-flags-usa.com/flags/nevada.jpg',
  'New Hampshire': 'http://www.state-flags-usa.com/flags/new-hampshire.jpg',
  'New Jersey': 'http://www.state-flags-usa.com/flags/new-jersey.jpg',
  'New Mexico': 'http://www.state-flags-usa.com/flags/new-mexico.jpg',
  'New York': 'http://www.state-flags-usa.com/flags/new-york.jpg',
  'North Carolina': 'http://www.state-flags-usa.com/flags/north-carolina.jpg',
  'North Dakota': 'http://www.state-flags-usa.com/flags/north-dakota.jpg',
  'Ohio': 'http://www.state-flags-usa.com/flags/ohio.jpg',
  'Oklahoma': 'http://www.state-flags-usa.com/flags/oklahoma.jpg',
  'Oregon': 'http://www.state-flags-usa.com/flags/oregon.jpg',
  'Pennsylvania': 'http://www.state-flags-usa.com/flags/pennsylvania.jpg',
  'Rhode Island': 'http://www.state-flags-usa.com/flags/rhode-island.jpg',
  'South Carolina': 'http://www.state-flags-usa.com/flags/south-carolina.jpg',
  'South Dakota': 'http://www.state-flags-usa.com/flags/south-dakota.jpg',
  'Tennessee': 'http://www.state-flags-usa.com/flags/tennessee.jpg',
  'Texas': 'http://www.state-flags-usa.com/flags/texas.jpg',
  'Utah': 'http://www.state-flags-usa.com/flags/utah.jpg',
  'Vermont': 'http://www.state-flags-usa.com/flags/vermont.jpg',
  'Virginia': 'http://www.state-flags-usa.com/flags/virginia.jpg',
  'Washington': 'http://www.state-flags-usa.com/flags/washington.jpg',
  'West Virginia': 'http://www.state-flags-usa.com/flags/west-virginia.jpg',
  'Wisconsin': 'http://www.state-flags-usa.com/flags/wisconsin.jpg',
  'Wyoming': 'http://www.state-flags-usa.com/flags/wyoming.jpg',
};

class CountyScreen extends StatefulWidget {
  List<String> stateNames = [];
  String countyData;
  CountyModel cm;

  CountyScreen() {
    states.forEach((k, v) => stateNames.add(k));
    stateNames.sort();
  }

  makeCountyCall() async {
    NetworkHelper nh = NetworkHelper(
        'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv');
    countyData = await nh.getData();
    cm = CountyModel(
      stateNames,
      countyData,
    );
  }

  @override
  _CountyScreenState createState() => _CountyScreenState();
}

class _CountyScreenState extends State<CountyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoronaVirus by County'),
      ),
      body: Container(
        child: Text('Counties'),
      ),
    );
  }
}
