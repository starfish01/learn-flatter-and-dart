import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/rendering.dart';

import './scoped-models/main.dart';

import './pages/auth.dart';
import './pages/todotasks_list.dart';

// Color Palattee
//https://www.color-hex.com/color-palette/30415

void main() {
   //debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(ToDoApp());
}

class ToDoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToDoAppState();
  }
}

class _ToDoAppState extends State<ToDoApp> {
  final MainModel _model = MainModel();

  @override
  Widget build(BuildContext context) {
    print('building main page');
    return ScopedModel<MainModel>(
        model: _model,
        child: MaterialApp(
          theme: ThemeData(
              //inset Theme Data here
              ),
          routes: {
            '/': (BuildContext context) => AuthPage(),
            '/ToDoTasks': (BuildContext context) => ToDoTasksList()
          },
          onGenerateRoute: (RouteSettings settings) {
            //will need to set this up
          },
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(
                builder: (BuildContext context) => AuthPage());
          },
        ));
  }
}
