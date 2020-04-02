import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        backgroundColor: Color.fromARGB(
          255,
          23,
          179,
          15,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Data provided by the NYTimes',
            ),
          ],
        ),
      ),
    );
  }
}
