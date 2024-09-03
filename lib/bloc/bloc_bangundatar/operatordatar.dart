import 'package:flutter_bloc/flutter_bloc.dart';

class Operatordatar extends Bloc<Operatordatar, int>{
  Operatordatar({this.init = 0}) : super(init);
  int init;
  void setIndex (int index){
    emit(init = index);
  }
  void onChange(Change<int> change){
    super.onChange(change);
    print(change);
  }
}

class listBangunDatar {
  List<String> operator = <String>[
    'Lingkaran',
    'Persegi panjang',
    'segitiga',
  ];
}