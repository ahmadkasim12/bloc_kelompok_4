import 'package:flutter_bloc/flutter_bloc.dart';

abstract class InputEvent {}

class UpdateInputs extends InputEvent {
  final double inputPanjang;
  final double inputLebar;
  final double inputTinggi;
  final double inputAlas;
  final double inputRuas;

  UpdateInputs(this.inputPanjang, this.inputLebar, this.inputTinggi,
      this.inputAlas, this.inputRuas);
}

class InputHolderBloc2 extends Bloc<InputEvent, Map<String, double>> {
  InputHolderBloc2()
      : super(
            {"input1": 0, "input2": 0, "input3": 0, "input4": 0, "input5": 0}) {
    on<UpdateInputs>((event, emit) {
      emit({
        "input1": event.inputPanjang,
        "input2": event.inputLebar,
        "input3": event.inputTinggi,
        "input4": event.inputAlas,
        "input5": event.inputRuas,
      });
    });
  }
}
