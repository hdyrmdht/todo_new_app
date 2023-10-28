
  import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String local="en";
  ThemeMode theme=ThemeMode.light;

changetheme(mode){
      theme=mode;
      notifyListeners();
}
     
  changelanguage(String langCode){
    local=langCode;
    notifyListeners();

  }
}