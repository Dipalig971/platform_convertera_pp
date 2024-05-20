import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConverterProvider extends ChangeNotifier {
  DateTime dateselect = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  void ChangeDatePick(value) {
    dateselect = value;
    notifyListeners();
  }

  void ChangeTime(value) {
    timeOfDay = value;
    notifyListeners();
  }

  void ChangeDateTime(value) {
    timeOfDay = TimeOfDay(hour: dateselect.hour, minute: dateselect.minute);
    notifyListeners();
  }
}
