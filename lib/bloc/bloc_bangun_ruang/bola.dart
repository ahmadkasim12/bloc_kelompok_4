import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_aritmatika/input_event.dart';

class KalkulasiBola extends Bloc<InputEvent, double> {
  KalkulasiBola({this.operatorResult = 0}) : super(operatorResult);
  double operatorResult;

  void doOperation(double input5) {
    emit(operatorResult = 4 / 3 * 3.14 * (input5 * input5 * input5));
  }
}
