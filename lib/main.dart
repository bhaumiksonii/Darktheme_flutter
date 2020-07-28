import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
        theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Dynamic Theme'),
          ),
          body: Center(
            child: Text('Hello World'),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Dark Theme'),
                  trailing: Switch(
                    value: snapshot.data,
                    onChanged: bloc.changeTheme,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();
