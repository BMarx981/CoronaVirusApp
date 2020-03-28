import 'dart:math';

class StateModel {
  List<String> stateNames = [];
  Map<String, StateData> mapData = Map<String, StateData>();
  String data;
  List<StateData> sd = List<StateData>();
  List<String> tempData = List<String>();
  Set<StateData> dataSet = Set<StateData>();
  List<StateData> dataList = List<StateData>();

  StateModel(this.data, this.stateNames) {
    stateNames.forEach(
      (item) => mapData[item] = StateData(),
    );
    tempData = data.split('\n');
    tempData.removeAt(0);
    tempData.forEach((item) => getNumbersFromNames(item));
  }

  getNumbersFromNames(String item) {
    String tempDate = item.split(',')[0];
    List spDate = tempDate.split('-');
    DateTime d = DateTime(
      int.parse(spDate[0]),
      int.parse(spDate[1]),
      int.parse(spDate[2]),
    );
    String tempName = item.split(',')[1];
    int tempPos = int.parse(item.split(',')[3]);
    assert(tempPos is int);
    int tempDeath = int.parse(item.split(',')[4]);
    assert(tempDeath is int);
    StateData s = StateData(
        date: d, name: tempName, positiveCase: tempPos, deaths: tempDeath);
    mapData[s.name] = s;
  }
}

class StateData {
  final DateTime date;
  final String name;
  final int positiveCase;
  final int deaths;

  StateData({this.date, this.name, this.positiveCase, this.deaths});

  @override
  String toString() {
    return 'Name: $name, Positive Cases: $positiveCase, Deaths: $deaths On date: ${date.month}/${date.day}/${date.year}';
  }
}
