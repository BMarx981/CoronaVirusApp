import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'See where your state and county are in terms of reported CoronaVirus infection cases and '
                'deaths. Tap a state to see the data for the counties in that state.',
                style: TextStyle(fontSize: 18),
              ),
              Divider(),
              SizedBox(height: 8),
              Text(
                'Remember to wash your hands frequently, stay six feet from others who are not living with '
                'you. Social distancing is the only way to supress the virus right now.',
                style: TextStyle(fontSize: 18),
              ),
              Divider(),
              SizedBox(height: 8),
              Text(
                'Data provided by the NYTimes',
                style: TextStyle(fontSize: 18),
              ),
              InkWell(
                child: Text(
                  'Link to data',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 18.0,
                  ),
                ),
                onTap: () {
                  _launchInBrowser(
                      'https://www.nytimes.com/interactive/2020/us/coronavirus-us-cases.html');
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
