import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {

  String _gender;
  double _discreteValue = 20.0;

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
                        Radio(value: "all", groupValue: _gender, onChanged: null),
                        Text("All"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(value: "all", groupValue: _gender, onChanged: null),
                        Text("Male"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Radio(value: "all", groupValue: _gender, onChanged: null),
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
    this.children
  });

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
