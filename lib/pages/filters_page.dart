import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:randomuser_flutter_app/redux/app_state.dart';
import 'package:randomuser_flutter_app/redux/user/user_actions.dart';

import 'package:randomuser_flutter_app/models/user_filters.dart';

class FiltersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _FiltersPageViewModel>(
      converter: (Store<AppState> store) => _FiltersPageViewModel.fromStore(store),
      builder: (BuildContext context, _FiltersPageViewModel vm) =>
        _FiltersPageContent(filters: vm.filters,)
    );
  }
}

class _FiltersPageContent extends StatefulWidget {
  UserFilters filters;

  _FiltersPageContent({Key key, this.filters}): super(key: key);

  @override
  __FiltersPageContentState createState() => __FiltersPageContentState();
}

class __FiltersPageContentState extends State<_FiltersPageContent> {
  final items = <DropdownMenuItem>[
    DropdownMenuItem(child: Text("US"), value: "US",),
    DropdownMenuItem(child: Text("DK"), value: "DK",),
    DropdownMenuItem(child: Text("FR"), value: "FR",),
    DropdownMenuItem(child: Text("GB"), value: "GB",),
  ];

  _onGenderChange(String value){
    setState(() {
      widget.filters.gender = value;
    });
  }

  _onAgeChange(double value){
    setState(() {
      widget.filters.age = value;
    });
  }

  _onNationalityChange(selected){
    setState(() {
      widget.filters.nat = selected;
    });
  }

  _clearFilters(){
    setState(() {
      widget.filters = UserFilters();
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
              store.dispatch(ApplyFiltersAction(widget.filters));
            },
            builder: (BuildContext context, VoidCallback callback) =>
              FlatButton(child: Text("Apply", style: TextStyle(color: Colors.white),), onPressed: callback)
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
                        Radio(value: null, groupValue: widget.filters.gender, onChanged: _onGenderChange),
                        Text("All"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(value: "male", groupValue: widget.filters.gender, onChanged: _onGenderChange),
                        Text("Male"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(value: "female", groupValue: widget.filters.gender, onChanged: _onGenderChange),
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
                  value: widget.filters.age,
                  min: 0.0,
                  max: 100.0,
                  divisions: 10,
                  label: '${widget.filters.age.round()}',
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
                  value: widget.filters.nat,
                  onChanged: _onNationalityChange
                )
              ],
            ),
            StoreConnector(
              converter: (Store<AppState> store) => _clearFilters,
              builder: (BuildContext context, VoidCallback callback) =>
                Center(
                  child: RaisedButton.icon(
                    onPressed: callback,
                    icon: Icon(Icons.delete),
                    label: Text("Clear Filters")
                  ),
                ),
            ),
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

class _FiltersPageViewModel {
  final UserFilters filters;

  _FiltersPageViewModel({this.filters});

  factory _FiltersPageViewModel.fromStore(Store<AppState> store) {
    return _FiltersPageViewModel(
      filters: store.state.userState.filters
    );
  }
}