import 'package:aapna_bazar/theme/themes.dart';
import 'package:flutter/material.dart';


class PepsiCoProvider with ChangeNotifier{
  String _myStringDrink = "Not created yet";
  String get myStringDrink => _myStringDrink;

  void produceStringProduct(){
    _myStringDrink = "String produce, now you can drink";
    notifyListeners();
  }

  // int _counter = 0;
  // int get counter => _counter;
  //
  // void increaseInteger(){
  //   _counter++;
  //   notifyListeners();
  // }


  ThemeData _currentTheme = AppThemes().lightTheme();
  ThemeData get currentTheme => _currentTheme;


  void switchTheme(bool isSwitched){
    if(isSwitched == true){
      _currentTheme = AppThemes().darkTheme();
      notifyListeners();
    }else{
      _currentTheme = AppThemes().lightTheme();
      notifyListeners();
    }
  }

/// 1. create a variable to use for theme update
/// 2. create a function to switch the current theme
///

}