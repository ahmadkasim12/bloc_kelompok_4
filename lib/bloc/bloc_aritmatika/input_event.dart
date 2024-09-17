import 'package:flutter_bloc/flutter_bloc.dart';
import 'operator_bloc.dart';

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
