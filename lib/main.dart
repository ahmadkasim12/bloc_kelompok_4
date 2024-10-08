import 'package:bloc_implementation_assignment/Screens/AritmatikaPage.dart';
import 'package:bloc_implementation_assignment/Screens/BangunDatarScreen.dart';
import 'package:bloc_implementation_assignment/Screens/BangunRuangScreen.dart';
import 'package:bloc_implementation_assignment/Screens/Perpangkatan.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_aritmatika/input_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      BlocProvider(
        create: (context) => InputHolderBloc(),
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
