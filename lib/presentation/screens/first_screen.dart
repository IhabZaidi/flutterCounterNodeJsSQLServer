// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocexampl/logic/cubit/counter_cubit.dart';
import 'package:flutterblocexampl/presentation/widgets/custom_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        state.isIncreased == true ? log('Yep It icreased') : log('Nooo It deccreased');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              CustomButton(
                  onPressed: () => {Navigator.of(context).pushNamed('/second')})
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: BlocProvider.of<CounterCubit>(context).emitDecrease,
              tooltip: 'Decrement',
              child: const Icon(Icons.download),
            ),
            FloatingActionButton(
              onPressed: BlocProvider.of<CounterCubit>(context).emitIncrease,
              tooltip: 'Increment',
              child: const Icon(Icons.upload),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
