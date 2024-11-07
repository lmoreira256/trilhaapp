import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _finished = false;

  Task(this._description, this._finished);

  String getId() {
    return _id;
  }

  String getDescription() {
    return _description;
  }

  void setDescription(String description) {
    _description = description;
  }

  bool isFiniched() {
    return _finished;
  }

  void setFinished(bool finished) {
    _finished = finished;
  }
}
