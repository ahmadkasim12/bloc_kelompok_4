import 'dart:math';
import 'package:bloc_implementation_assignment/bloc/bloc_aritmatika/input_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PowOperation extends Bloc<InputEvent, double> {
  PowOperation({this.powResult = 0}) : super(powResult);
  double powResult;
  
  void doOperation (double input1, double input2){
    emit(powResult = pow(input1, input2) as double);
  }
}