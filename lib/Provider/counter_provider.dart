import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  var _count=3;
  int get count=>_count;

  void increment(){
    _count=_count+1;
    notifyListeners();
  }
  void dicrement(){
    _count=_count-1;
    notifyListeners();
  }
}