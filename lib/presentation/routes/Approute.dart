// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocexampl/logic/cubit/counter_cubit.dart';
import 'package:flutterblocexampl/presentation/screens/first_screen.dart';
import 'package:flutterblocexampl/presentation/screens/second_screen.dart';

class AppRouter {
  CounterCubit _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: MyHomePage(
              title: 'First Screen',
            ),
          ),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: ScoundScreen(
              title: 'Second Screen',
            ),
          ),
        );

      default:
        return null;
    }
  }
}
