import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StateProvider with ChangeNotifier {
  String _APP_NAME = "Tictac";
  AnimationController _PADDING_ANIMATION_CONTROLLER;
  Animation _PADDING_ANIMATION;
  PageController _MAIN_PAGE_CONTROLLER;


  String get APP_NAME => _APP_NAME;
  AnimationController get PADDING_ANIMATION_CONTROLLER => _PADDING_ANIMATION_CONTROLLER;
  Animation get PADDING_ANIMATION => _PADDING_ANIMATION;
  PageController get MAIN_PAGE_CONTROLLER => _MAIN_PAGE_CONTROLLER;

  set APP_NAME(String val) {
    _APP_NAME = val;
    notifyListeners();
  }

  set PADDING_ANIMATION_CONTROLLER(AnimationController val) {
    _PADDING_ANIMATION_CONTROLLER = val;
    notifyListeners();
  }

  set PADDING_ANIMATION(Animation val) {
    _PADDING_ANIMATION = val;
    notifyListeners();
  }

  set MAIN_PAGE_CONTROLLER(PageController val) {
    _MAIN_PAGE_CONTROLLER = val;
    notifyListeners();
  }

}