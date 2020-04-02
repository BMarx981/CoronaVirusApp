import 'package:flutter/material.dart';
import 'models/state_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  final blue = Colors.white;
  List<String> stateNames = [];
  StateModel sm;
  Map<String, StateData> dataMap = Map<String, StateData>();

  @override
  initState() {
    super.initState();
    states.forEach((k, v) => stateNames.add(k));
    stateNames.sort();
    setup();
  }

  setup() async {
    sm = StateModel(stateNames);
    await sm.setupData();
    setState(() {
      dataMap = sm.getMapData;
    });
  }

  Future<Null> _refreshIt() async {
    setState(() {
      dataMap = sm.getMapData;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () {
          return _refreshIt();
        },
        child: ListView(
          children: <Widget>[
            generateState('Alabama'),
            generateState('Alaska'),
            generateState('Arizona'),
            generateState('Arkansas'),
            generateState('California'),
            generateState('Colorado'),
            generateState('Connecticut'),
            generateState('Delaware'),
            generateState('Florida'),
            generateState('Georgia'),
            generateState('Hawaii'),
            generateState('Idaho'),
            generateState('Illinois'),
            generateState('Indiana'),
            generateState('Iowa'),
            generateState('Kansas'),
            generateState('Kentucky'),
            generateState('Louisiana'),
            generateState('Maine'),
            generateState('Maryland'),
            generateState('Massachusetts'),
            generateState('Michigan'),
            generateState('Minnesota'),
            generateState('Mississippi'),
            generateState('Missouri'),
            generateState('Montana'),
            generateState('Nebraska'),
            generateState('Nevada'),
            generateState('New Hampshire'),
            generateState('New Jersey'),
            generateState('New Mexico'),
            generateState('New York'),
            generateState('North Carolina'),
            generateState('North Dakota'),
            generateState('Ohio'),
            generateState('Oklahoma'),
            generateState('Oregon'),
            generateState('Pennsylvania'),
            generateState('Rhode Island'),
            generateState('South Carolina'),
            generateState('South Dakota'),
            generateState('Tennessee'),
            generateState('Texas'),
            generateState('Utah'),
            generateState('Vermont'),
            generateState('Virginia'),
            generateState('Washington'),
            generateState('West Virginia'),
            generateState('Wisconsin'),
            generateState('Wyoming'),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('CoronaVirus data by State'),
        backgroundColor: Color.fromARGB(255, 150, 110, 250),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.info),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget generateState(String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          dataMap = sm.getMapData;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CountyScreen(name),
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
                color: Colors.black54,
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 0.3, // has the effect of extending the shadow
                offset: Offset(
                  1.0, // horizontal, move right 10
                  4.0, // vertical, move down 10
                ),
              )
            ],
            color: Color.fromARGB(255, 140, 120, 240),
            border: Border.all(
              color: Colors.black,
              width: 2,
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
                  spinOrText(dataMap, false, name),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  spinOrText(dataMap, true, name),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget spinOrText(Map<String, StateData> map, bool death, String name) {
    if (map != null) {
      if (!death) {
        return Text(
          'Positive Cases: ${dataMap.isEmpty ? '' : dataMap[name].positiveCase}',
          style: TextStyle(fontSize: 18, color: blue),
        );
      } else {
        return Text(
          'Deaths: ${dataMap.isEmpty ? '' : dataMap[name].deaths}',
          style: TextStyle(fontSize: 18, color: blue),
        );
      }
    } else {
      return const SpinKitThreeBounce(color: Colors.white);
    }
  }
}
