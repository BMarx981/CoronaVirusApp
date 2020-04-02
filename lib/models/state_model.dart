import 'package:coronavirus_app/networking/networking.dart';

class StateModel {
  Map<String, StateData> _mapData = Map<String, StateData>();
  String data;
  List<StateData> sd = List<StateData>();

  StateModel(List<String> stateNames) {
    stateNames.forEach((item) => _mapData[item] = StateData());
  }

  Future setupData() async {
    List<String> tempData = List<String>();
    data = await makeStateCall();
    tempData = data.split('\n');
    tempData.removeAt(0);
    tempData.forEach((item) => getNumbersFromNames(item));
  }

  Future getNumbersFromNames(String item) async {
    String tempDate = item.split(',')[0];
    List spDate = tempDate.split('-');
    DateTime d = DateTime(
      int.parse(spDate[0]),
      int.parse(spDate[1]),
      int.parse(spDate[2]),
    );
    String tempName = item.split(',')[1];
    int tempPos = int.parse(item.split(',')[3]);
    int tempDeath = int.parse(item.split(',')[4]);
    StateData s = StateData(
        date: d, name: tempName, positiveCase: tempPos, deaths: tempDeath);
    _mapData[s.name] = s;
  }

  Future<String> makeStateCall() async {
    NetworkHelper nh = NetworkHelper(
        'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv');
    return await nh.getData();
  }

  Map<String, StateData> get getMapData {
    if (_mapData.isEmpty) {
      print('Empty');
    }
    return _mapData;
  }
}

class StateData {
  DateTime date = DateTime.now();
  String name = '';
  int positiveCase = 0;
  int deaths = 0;

  StateData({this.date, this.name, this.positiveCase, this.deaths});

  @override
  String toString() {
    return 'Name: $name, Positive Cases: $positiveCase, Deaths: $deaths On date: ${date.month}/${date.day}/${date.year}';
  }
}
