import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bottom_navigation_bloc/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:bottom_navigation_bloc/ui/app_screen.dart';

import 'repositories/repositories.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc(
          firstPageRepository: FirstPageRepository(),
          secondPageRepository: SecondPageRepository(),
        )..add(AppStarted()),
        child: AppScreen(),
      ),
    );
  }
}
