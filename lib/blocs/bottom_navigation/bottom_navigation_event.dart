import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  BottomNavigationEvent([List props = const []]) : super(props);
}

class FirstPageTapped extends BottomNavigationEvent {
  @override
  String toString() => 'FirstPageTapped';
}

class SecondPageTapped extends BottomNavigationEvent {
  @override
  String toString() => 'SecondPageTapped';
}

class ThirdPageTapped extends BottomNavigationEvent {
  @override
  String toString() => 'ThirdPageTapped';
}