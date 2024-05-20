import 'package:flutter/cupertino.dart';

class ProfileSwitchProvider extends ChangeNotifier{
  bool isactive = false;

  void ischangeProfile(bool value){
    isactive =value;
    notifyListeners();
  }
}

