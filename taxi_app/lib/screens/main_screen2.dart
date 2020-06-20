import 'package:flutter/material.dart';
import '../widgets/ui_Container.dart';

class MainScreen2 extends StatefulWidget {

  static const routeName = '/mainscreen2';

  @override
  _MainScreen2State createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {

  List<String> getType = ['Taxi', 'Rickshaw'];
  String selectedtype;
  String selectedResponse;
  List<String> getResponse = ['Yes', 'No'];

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List types){
    List<DropdownMenuItem<String>> items = List();
    for(String type in types){
      items.add(
        DropdownMenuItem(
          value: type, 
          child: Text(type, style: TextStyle(color: Theme.of(context).primaryColor),)
        )
      );
    } 
    return items;
  }
  int _groupValue = -1;
  Widget _myRadioButton({String title, int value, Function onChanged}) {
  return RadioListTile(
    activeColor: Theme.of(context).primaryColor,
    value: value,
    groupValue: _groupValue,
    onChanged: onChanged,
    title: Text(title),
  );
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Same Location, Same Taxi'),),
      body: Column(children: <Widget>[
        SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          child: UiContainer(
            Column(
              children: <Widget>[
                Text(
                  'Select A Mode',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontStyle: FontStyle.italic
                  ),
                ),
                DropdownButton(
                  value: selectedtype,
                  items: buildDropDownMenuItems(getType),
                  onChanged: (String val){
                    setState(() {
                      selectedtype = val;
                    });
                  },
                ),
              ],
            ),
            Theme.of(context).accentColor,
            size.width*0.8
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: UiContainer(
            Column(children: <Widget>[
              Text(
                'Do you want to Ride Now',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.italic
                ),
              ),
              _myRadioButton(
                title: "Yes",
                value: 0,
                onChanged: (newValue) => setState(() => _groupValue = newValue),
              ),
              _myRadioButton(
                title: "No",
                value: 1,
                onChanged: (newValue) => setState(() => _groupValue = newValue),
              ),
            ],),
            Theme.of(context).accentColor,
            size.width*0.8
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: UiContainer(
            Column(
              children: <Widget>[
                Text(
                  'Are you already in the vehicle?',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontStyle: FontStyle.italic
                  ),
                ),
                DropdownButton(
                  value: selectedResponse,
                  items: buildDropDownMenuItems(getResponse),
                  onChanged: (String value){
                    setState(() {
                      selectedResponse = value;
                    });
                  },
                ),
              ],
            ),
            Theme.of(context).accentColor,
            size.width*0.8
          ),
        ),
      ],)
    );
  }
}