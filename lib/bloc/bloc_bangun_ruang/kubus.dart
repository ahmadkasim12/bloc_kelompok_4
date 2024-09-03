import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_aritmatika/input_bloc.dart';

class KalkulasiKubus extends Bloc<InputEvent, double> {
  KalkulasiKubus({this.operatorResult = 0}) : super(operatorResult);
  double operatorResult;

  void doOperation(double input4) {
    emit(operatorResult = 12 * input4);
  }
}
