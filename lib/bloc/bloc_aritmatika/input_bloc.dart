import 'package:flutter_bloc/flutter_bloc.dart';
import 'operator.dart';

abstract class InputEvent {}

Operator aritmatika = Operator();

class UpdateInputs extends InputEvent {
  final double input1;
  final double input2;

  UpdateInputs(this.input1, this.input2);
}

class InputHolderBloc extends Bloc<InputEvent, Map<String, double>> {
  InputHolderBloc() : super({"input1": 0, "input2": 0}) {
    on<UpdateInputs>((event, emit) {
      emit({
        "input1": event.input1,
        "input2": event.input2,
      });
    });
  }
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
