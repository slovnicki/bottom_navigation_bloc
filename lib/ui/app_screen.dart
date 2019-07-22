import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bottom_navigation_bloc/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:flutter_bottom_navigation_bloc/ui/pages/pages.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation with BLoC'),
      ),
      body: BlocBuilder<BottomNavigationEvent, BottomNavigationState>(
        bloc: bottomNavigationBloc,
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FirstPageLoaded) {
            return FirstPage();
          }
          if (state is SecondPageLoaded) {
            return SecondPage();
          }
          if (state is ThirdPageLoaded) {
            return ThirdPage();
          }
          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            title: Text('First'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset, color: Colors.black),
            title: Text('Second'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive, color: Colors.black),
            title: Text('Third'),
          ),
        ],
        onTap: (index) { bottomNavigationBloc.onTap(index); },
      ),
    );
  }
}