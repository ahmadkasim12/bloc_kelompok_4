import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_aritmatika/input_event.dart';
import 'dart:math';

class KalkulasiLingkaran extends Bloc<InputEvent, double> {
  KalkulasiLingkaran({this.operatorResult = 0}) : super(operatorResult);
  double operatorResult;

  void doOperation(double input5) {
    emit(operatorResult = 2 * pi * input5);
  }
}
