import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:randomuser_flutter_app/redux/app_state.dart';
import 'package:randomuser_flutter_app/redux/user_actions.dart';

import 'package:randomuser_flutter_app/models/user_filters.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {

  UserFilters filters = UserFilters(age: 100.0);
  final items = <DropdownMenuItem>[
    DropdownMenuItem(child: Text("US"), value: "US",),
    DropdownMenuItem(child: Text("DK"), value: "DK",),
    DropdownMenuItem(child: Text("FR"), value: "FR",),
    DropdownMenuItem(child: Text("GB"), value: "GB",),
  ];

  _onGenderChange(String value){
    setState(() {
      filters.gender = value;
    });
  }

  _onAgeChange(double value){
    setState(() {
      filters.age = value;
    });
  }

  _onNationalityChange(selected){
    setState(() {
      filters.nationality = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          StoreConnector(
            converter: (Store<AppState> store) => (){
              Navigator.pop(context);
              store.dispatch(ApplyFiltersAction(filters));
            },
            builder: (BuildContext context, VoidCallback callback){
              return FlatButton(
                  child: Text("Apply"),
                  onPressed: callback
              );
            }
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _FilterSection(
              children: <Widget>[
                Text("Gender:", style: TextStyle(fontSize: 18.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Radio(value: null, groupValue: filters.gender, onChanged: _onGenderChange),
                        Text("All"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(value: "male", groupValue: filters.gender, onChanged: _onGenderChange),
                        Text("Male"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(value: "female", groupValue: filters.gender, onChanged: _onGenderChange),
                        Text("Female"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            _FilterSection(
              children: <Widget>[
                Text("Age:", style: TextStyle(fontSize: 18.0),),
                Slider(
                  value: filters.age,
                  min: 0.0,
                  max: 100.0,
                  divisions: 10,
                  label: '${filters.age.round()}',
                  onChanged: _onAgeChange
                )
              ],
            ),
            Divider(),
            _FilterSection(
              children: <Widget>[
                Text("Nationality:", style: TextStyle(fontSize: 18.0),),
                DropdownButton(
                  items: items,
                  value: filters.nationality,
                  onChanged: _onNationalityChange
                )
              ],
            )
          ],
        ),
      )
    );
  }
}


class _FilterSection extends StatelessWidget {
  final List<Widget> children;

  _FilterSection({
    Key key,
    this.children
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Center(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children
        )
      )
    );
  }
}
