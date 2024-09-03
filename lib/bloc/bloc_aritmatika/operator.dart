import 'package:flutter_bloc/flutter_bloc.dart';

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