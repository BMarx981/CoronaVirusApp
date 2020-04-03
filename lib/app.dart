import 'package:flutter/material.dart';
import 'state_screen.dart';
import 'county_screen.dart';
import 'info_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'states': (context) => StateScreen(),
        'counties': (context) => CountyScreen('', '', ''),
        'info': (context) => InfoScreen(),
      },
      initialRoute: 'states',
    );
  }
}
