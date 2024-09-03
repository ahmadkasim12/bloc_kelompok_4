import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_aritmatika/input_bloc.dart';

class KalkulasiSegitiga extends Bloc<InputEvent, double> {
  KalkulasiSegitiga({this.operatorResult = 0}) : super(operatorResult);
  double operatorResult;

  void doOperation(double input4) {
    emit(operatorResult = 3 * input4);
  }
}
