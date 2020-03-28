import 'package:flutter/material.dart';
import 'models/state_model.dart';
import 'networking/networking.dart';
import 'county_screen.dart';

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

class StateScreen extends StatefulWidget {
  List<String> stateNames = [];
  String data;
  String countyData;
  StateModel sm;

  StateScreen() {
    states.forEach((k, v) => stateNames.add(k));
    stateNames.sort();
    makeStateCall();
  }

  makeStateCall() async {
    NetworkHelper nh = NetworkHelper(
        'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv');
    data = await nh.getData();
    sm = StateModel(data, stateNames);
  }

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          generateState('Alabama'),
          generateState('Alaska'),
        ],
      ),
      appBar: AppBar(
        title: Text('CoronaVirus data by State'),
      ),
    );
  }

  Widget generateState(String name) {
    final blue = Colors.blue[900];
    return GestureDetector(
      onTap: () {
        print('Pushed');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CountyScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 4.0, // has the effect of extending the shadow
                offset: Offset(
                  1.0, // horizontal, move right 10
                  3.0, // vertical, move down 10
                ),
              )
            ],
            color: Colors.grey[350],
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.all(
              Radius.elliptical(
                28.0,
                2,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 28, color: blue),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Image.network(
                states[name],
                fit: BoxFit.fill,
                scale: .7,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Positive Cases: ${widget.sm.mapData[name].positiveCase}',
                    style: TextStyle(fontSize: 18, color: blue),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Deaths: ${widget.sm.mapData[name].deaths}',
                    style: TextStyle(fontSize: 18, color: blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
