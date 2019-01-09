import 'dart:convert';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth.dart';
import '../models/ToDoTask.dart';
import '../models/user.dart';

mixin ConnectedItemsModel on Model {

}

