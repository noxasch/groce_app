import 'package:flutter/material.dart';

enum HomeState {
  normal,
  cart,
}

class HomeStateController extends ChangeNotifier {
  HomeState homeState;

  HomeStateController({
    this.homeState = HomeState.normal
  });

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }
}
