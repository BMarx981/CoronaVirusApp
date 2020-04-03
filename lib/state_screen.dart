import 'package:flutter/material.dart';
import 'models/state_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'county_screen.dart';
import 'models/county_model.dart';
import 'info_screen.dart';

const Map states = {
  'Alabama': 'alabama.jpg',
  'Alaska': 'alaska.jpg',
  'Arizona': 'arizona.jpg',
  'Arkansas': 'arkansas.jpg',
  'California': 'california.jpg',
  'Colorado': 'colorado.jpg',
  'Connecticut': 'connecticut.jpg',
  'Delaware': 'delaware.jpg',
  'District of Columbia': 'District of Columbia.png',
  'Florida': 'florida.jpg',
  'Georgia': 'georgia.jpg',
  'Hawaii': 'hawaii.jpg',
  'Idaho': 'idaho.jpg',
  'Illinois': 'illinois.jpg',
  'Indiana': 'indiana.jpg',
  'Iowa': 'iowa.jpg',
  'Kansas': 'kansas.jpg',
  'Kentucky': 'kentucky.jpg',
  'Louisiana': 'louisiana.jpg',
  'Maine': 'maine.jpg',
  'Maryland': 'maryland.jpg',
  'Massachusetts': 'massachusetts.jpg',
  'Michigan': 'michigan.jpg',
  'Minnesota': 'minnesota.jpg',
  'Mississippi': 'mississippi.jpg',
  'Missouri': 'missouri.jpg',
  'Montana': 'montana.jpg',
  'Nebraska': 'nebraska.jpg',
  'Nevada': 'nevada.jpg',
  'New Hampshire': 'new-hampshire.jpg',
  'New Jersey': 'new-jersey.jpg',
  'New Mexico': 'new-mexico.jpg',
  'New York': 'new-york.jpg',
  'North Carolina': 'north-carolina.jpg',
  'North Dakota': 'north-dakota.jpg',
  'Ohio': 'ohio.jpg',
  'Oklahoma': 'oklahoma.jpg',
  'Oregon': 'oregon.jpg',
  'Pennsylvania': 'pennsylvania.jpg',
  'Rhode Island': 'rhode-island.jpg',
  'South Carolina': 'south-carolina.jpg',
  'South Dakota': 'south-dakota.jpg',
  'Tennessee': 'tennessee.jpg',
  'Texas': 'texas.jpg',
  'Utah': 'utah.jpg',
  'Vermont': 'vermont.jpg',
  'Virginia': 'virginia.jpg',
  'Washington': 'washington.jpg',
  'West Virginia': 'west-virginia.jpg',
  'Wisconsin': 'wisconsin.jpg',
  'Wyoming': 'wyoming.jpg',
};

class StateScreen extends StatefulWidget {
  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  final blue = Colors.white;
  List<String> stateNames = [];
  String counties;
  StateModel sm;
  CountyModel cm;
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
    cm = CountyModel.empty();
    counties = await cm.makeCountyCall();
//    counties.split('\n').forEach((line) => print(line));
//    print(counties);
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
            generateState('District of Columbia'),
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
        backgroundColor: Color.fromARGB(
          255,
          23,
          179,
          15,
        ), //Color.fromARGB(255, 150, 110, 250),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => InfoScreen()),
                );
              },
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
            builder: (BuildContext context) =>
                CountyScreen(name, counties, 'lib/assets/${states[name]}'),
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
              Hero(
                tag: name,
                child: Container(
                  height: 150,
                  width: 250,
                  child: Image(
                    image: AssetImage(
                      'lib/assets/${states[name]}',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
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
