import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_aritmatika/input_bloc.dart';

class KalkulasiBalok extends Bloc<InputEvent, double> {
  KalkulasiBalok({this.operatorResult = 0}) : super(operatorResult);
  double operatorResult;

  void doOperation(double input1, double input2, double input3) {
    emit(operatorResult = 4 * (input1 + input2 + input3));
  }
}
