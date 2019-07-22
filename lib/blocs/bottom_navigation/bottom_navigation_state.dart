import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable {
  BottomNavigationState([List props = const []]) : super(props);
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class FirstPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'FirstPageLoaded';
}

class SecondPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'SecondPageLoaded';
}

class ThirdPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'ThirdPageLoaded';
}