import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _finished = false;

  Task(this._description, this._finished);

  String get id => _id;

  String get description => _description.toUpperCase();

  set description(String description) {
    _description = description;
  }

  bool get isFiniched => _finished;

  set finished(bool finished) {
    _finished = finished;
  }
}
