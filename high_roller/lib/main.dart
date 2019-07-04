import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  List<int> _dice = [20, 12, 10, 8, 6, 4];
  List<int> _rolls = [];
  int _diceRolled = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: _getTheme(), home: Scaffold(
        appBar: AppBar(
          title: Container(
              margin: EdgeInsets.all(10.0),
              child: Row(children: [
                Image.asset('assets/icon.png'),
                Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text('High Roller')
                )
              ])
          )
        ),
        body: Column(children: [
          Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.all(10.0),
              child: _getButtons()
          ),
          Flexible(child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.3,
              children: _getDice()
          )),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(10.0),
            child: Text(_rolls.toString())
          )
        ])
    ));
  }

  ThemeData _getTheme() {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        accentColor: Colors.redAccent
    );
  }

  /// Creates and maintains the state of the number of dice to roll buttons
  Widget _getButtons() {
    return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.red,
              iconSize: 40.0,
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (_diceRolled > 1) {
                    _diceRolled = _diceRolled - 1;
                  }
                });
              },
            ),
          Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Text(_diceRolled.toString(), style: TextStyle(fontSize: 24.0))
          ),
          IconButton(
            color: Colors.green,
            iconSize: 40.0,
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _diceRolled = _diceRolled + 1;
              });
            }
          )
        ]
      )
    );
  }

  /// Creates the dice buttons
  List<Widget> _getDice() {
    List<Widget> result = [];
    _dice.forEach((element) {
      result.add(
          RaisedButton(
            child: Text(element.toString()),
            onPressed: (){
              _rolls = [];
              Random r = Random();
              setState(() {
                for (int i = 0; i < _diceRolled; i++) {
                  _rolls.add(r.nextInt(element) + 1);
                }
              });
            },
          )
      );
    });
    return result;
  }
}