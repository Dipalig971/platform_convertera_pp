import 'package:flutter/cupertino.dart';

class SwitchProvider extends ChangeNotifier{
  bool isActive = false;

  void changeSwitchProvider(bool value){
    isActive =value;
    notifyListeners();
  }
}
