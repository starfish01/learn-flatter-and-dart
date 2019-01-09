import 'package:flutter/material.dart';

// import './location_data.dart';

class ToDoTask {
  final String id;
  final String title;
  final String description;
  final String userId;

  ToDoTask ({
      @required this.id,
      @required this.title,
      @required this.description,
      @required this.userId,
  });
}