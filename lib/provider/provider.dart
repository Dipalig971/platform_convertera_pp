
import 'package:flutter/cupertino.dart';


class PlatformProvider extends ChangeNotifier{
  bool isIos = false;
  bool isDark = false;
  bool isProfile = false;

  void platformchange(bool value){
    isIos = value;
    notifyListeners();
  }

  void changeTheme(bool value){
    isDark = value;
    notifyListeners();
  }

  void changeProfile(bool value){
    isProfile = value;
    notifyListeners();
  }
}
