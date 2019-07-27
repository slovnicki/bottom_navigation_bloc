import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.dispatch(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        String text = await _fetchFirstPageData();
        yield FirstPageLoaded(text: text);
      }
      if (this.currentIndex == 1) {
        int number = await _fetchSecondPageData();
        yield SecondPageLoaded(number: number);
      }
    }
  }

  Future<String> _fetchFirstPageData() async {
    // simulate real data fetching
    await Future.delayed(Duration(milliseconds: 600));
    // return dummy data
    return 'First Page';
  }

  Future<int> _fetchSecondPageData() async {
    // simulate real data fetching
    await Future.delayed(Duration(milliseconds: 600));
    // return dummy data
    return Random().nextInt(1000);
  }
}