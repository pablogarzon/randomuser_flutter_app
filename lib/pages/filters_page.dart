import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {

  String _gender= "all";
  double _discreteValue = 20.0;
  String _nationality;
  final items = <DropdownMenuItem>[
    DropdownMenuItem(child: Text("US"), value: "US",),
    DropdownMenuItem(child: Text("DK"), value: "DK",),
    DropdownMenuItem(child: Text("FR"), value: "FR",),
    DropdownMenuItem(child: Text("GB"), value: "GB",),
  ];

  _onGenderChange(String value){
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: null, 
            child: Text("Apply") 
          )
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
                        Radio(value: "all", groupValue: _gender, onChanged: _onGenderChange),
                        Text("All"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(value: "male", groupValue: _gender, onChanged: _onGenderChange),
                        Text("Male"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(value: "female", groupValue: _gender, onChanged: _onGenderChange),
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
                  value: _discreteValue,
                  min: 0.0,
                  max: 100.0,
                  divisions: 5,
                  label: '${_discreteValue.round()}',
                  onChanged: (double value) {
                    setState(() {
                      _discreteValue = value;
                    });
                  },
                )
              ],
            ),
            Divider(),
            _FilterSection(
              children: <Widget>[
                Text("Nationality:", style: TextStyle(fontSize: 18.0),),
                DropdownButton(
                  items: items,
                  value: _nationality,
                  onChanged: (selected){
                    setState(() {
                      _nationality = selected;
                    });
                  },
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
