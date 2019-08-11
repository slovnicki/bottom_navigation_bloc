import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bottom_navigation_bloc/repositories/repositories.dart';
import 'package:bottom_navigation_bloc/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:bottom_navigation_bloc/ui/app_screen.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<BottomNavigationBloc>(
        builder: (context) => BottomNavigationBloc(
          firstPageRepository: FirstPageRepository(),
          secondPageRepository: SecondPageRepository(),
        )
          ..dispatch(AppStarted()),
        child: AppScreen(),
      )
    );
  }
}


