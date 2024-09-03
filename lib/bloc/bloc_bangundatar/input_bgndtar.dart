import 'package:bloc_implementation_assignment/bloc/bloc_aritmatika/input_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

  
class operatorBangunDatar extends Bloc<InputHolderBloc, double> {
  operatorBangunDatar({this.area = 0}) : super(area);
  double area;

  void calculateArea(double input1, double input2, int selectedIndex) {
    switch (selectedIndex) {
      case 0: // Persegi
        area = pi * pow(input1, 2);
        break;
      case 1: // Persegi Panjang
        area = input1 * input2;
        break;
      case 2: // Segitiga
        area = 0.5 * input1 * input2;
        break;
    }

    emit(area);
  }
}
