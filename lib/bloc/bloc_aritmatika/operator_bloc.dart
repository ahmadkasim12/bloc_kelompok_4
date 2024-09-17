import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_bangun_ruang/input-ruang.dart';

class Operator extends Bloc<Operator, int>{
  Operator({this.init = 0}) : super(init);
  int init;
  void setIndex (int index){
    emit(init = index);
  }
  void onChange(Change<int> change){
    super.onChange(change);
    print(change);
  }
}

class operatorAritmatika {
  List<String> operator = <String>[
    'Perjumlahan',
    'Pengurangan',
    'Perkalian',
    'Pembagian',
    'Modulus'
  ];
}

class InputOperation extends Bloc<InputEvent, double> {
  InputOperation({this.operatorResult = 0}) : super(operatorResult);
  double operatorResult;
  void doOperation (double input1, double input2, int selectedIndex){

    switch(selectedIndex){
      case 0:
        emit(operatorResult = input1 + input2);
        break;
      case 1:
        emit(operatorResult = input1 - input2);
        break;
      case 2:
        emit(operatorResult = input1 * input2);
        break;
      case 3:
        emit(operatorResult = input1 / input2);
        break;
      case 4:
        emit(operatorResult = input1 % input2);
        break;
    }
  }
}