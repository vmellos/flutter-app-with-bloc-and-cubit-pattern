import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newchat/bloc/counter_bloc.dart';
import 'package:newchat/counter_page.dart';

import 'counter_cubit_page.dart';
import 'package:newchat/cubit/counter_bloc.dart';

import 'cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BlocProvider(
      //     create: (context) => CounterBloc(), child: const CounterPage()),
      home: BlocProvider(
          create: (context) => CounterCubit(), child: const CounterCubitPage()),
    );
  }
}
