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
  List<String> _dice = ['D20', 'D12', 'D10', 'D8', 'D6', 'D4'];
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
          Flexible(child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: _getDice()
          ))
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
      result.add(Card(child: Column(
        children: [
          Text(element)
        ],
      )));
    });
    return result;
  }
}