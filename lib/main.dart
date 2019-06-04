import 'package:flutter/material.dart';
import 'package:flutter_app_api_list/screens/home_screen.dart';

void main() => runApp(new MyApp());

final _theme = _themeData();

ThemeData _themeData() {
  ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.brown,
    accentColor: Colors.pink,
    scaffoldBackgroundColor: Colors.pink[100],
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Filmes',
      theme: _theme,
      home: HomeScreeen(),
    );
  }
}
