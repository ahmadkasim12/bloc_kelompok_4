import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_aritmatika/input_bloc.dart';
import 'dart:math';

class KalkulasiPersegiPanjang extends Bloc<InputEvent, double> {
  KalkulasiPersegiPanjang({this.operatorResult = 0}) : super(operatorResult);
  double operatorResult;

  void doOperation(double input1, double input2) {
    emit(operatorResult = 2 * (input1 + input2));
  }
}
