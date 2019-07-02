//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  List<String> _dice = ['D20', 'D12', 'D10', 'D8', 'D6', 'D4'];

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
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                  onPressed: () {},
                  child: Text('Add Product')
              )
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
        accentColor: Colors.red
    );
  }

  List<Widget> _getDice() {
    List<Widget> result = [];
    _dice.forEach((element) {
      result.add(Card(child: Column(
        children: [
          Image.asset('assets/icon.png'),
          Text(element)
        ],
      )));
    });
    return result;
  }
}