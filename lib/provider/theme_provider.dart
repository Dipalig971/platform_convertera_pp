import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDark = false;
  Brightness brightnessDark =Brightness.dark;
  Brightness brightnessLight =Brightness.light;

  void changeTheme(bool value){
    isDark=value;
    notifyListeners();
  }
  Brightness get themebrightness => brightnessDark;
}