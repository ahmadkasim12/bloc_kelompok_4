import 'package:flutter_bloc/flutter_bloc.dart';

abstract class InputEvent {}

class UpdateInputs extends InputEvent {
  final double inputPanjang;
  final double inputLebar;
  final double inputSisi;
  final double inputRuas;

  UpdateInputs(
      this.inputPanjang, this.inputLebar, this.inputSisi, this.inputRuas);
}

class InputHolderBloc3 extends Bloc<InputEvent, Map<String, double>> {
  InputHolderBloc3()
      : super({"input1": 0, "input2": 0, "input3": 0, "input4": 0}) {
    on<UpdateInputs>((event, emit) {
      emit({
        "input1": event.inputPanjang,
        "input2": event.inputLebar,
        "input3": event.inputSisi,
        "input4": event.inputRuas,
      });
    });
  }
}
