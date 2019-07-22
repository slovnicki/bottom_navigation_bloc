import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is FirstPageTapped) {
      yield PageLoading();
      await Future.delayed(Duration(milliseconds: 600)); // fetch some data
      yield FirstPageLoaded();
    }
    if (event is SecondPageTapped) {
      yield PageLoading();
      await Future.delayed(Duration(milliseconds: 500)); // fetch some data
      yield SecondPageLoaded();
    }
    if (event is ThirdPageTapped) {
      yield PageLoading();
      await Future.delayed(Duration(milliseconds: 400)); // fetch some data
      yield ThirdPageLoaded();
    }
  }

  void onTap(int index) {
    switch (index) {
      case 0: dispatch(FirstPageTapped()); break;
      case 1: dispatch(SecondPageTapped()); break;
      case 2: dispatch(ThirdPageTapped()); break;
      default: //
    }
  }
}