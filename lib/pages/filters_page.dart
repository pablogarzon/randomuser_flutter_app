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
            Column(
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
          ],
        ),
      )
    );
  }
}
