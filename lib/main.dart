import 'package:bloc_implementation_assignment/Screens/AritmatikaPage.dart';
import 'package:bloc_implementation_assignment/Screens/BangunDatarScreen.dart';
import 'package:bloc_implementation_assignment/Screens/BangunRuangScreen.dart';
import 'package:bloc_implementation_assignment/Screens/Perpangkatan.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_aritmatika/input_event.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_bangun_ruang/input-ruang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_datar/input_datar.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => InputHolderBloc(),
      ),
      BlocProvider(
        create: (context) => InputHolderBloc2(),
      ),
      BlocProvider(
        create: (context) => InputHolderBloc3(),
      )
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/arimatika',
      routes: {
        '/arimatika': (context) => Aritmatikapage(),
        '/bangundatar': (context) => Bangundatarscreen(),
        '/bangunruang': (context) => Bangunruangscreen(),
        '/perpangkatan': (context) => Perpangkatan(),
      },
    ),
  ));
}
