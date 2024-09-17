import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/Drawer.dart';
import '../Widgets/GenericButton.dart';
import '../Widgets/GenericTextField.dart';
import '../bloc/bloc_aritmatika/input_event.dart';
import '../bloc/bloc_perpangkatan/operator_perpangkatan.dart';

class Perpangkatan extends StatelessWidget {
  Perpangkatan({super.key});
  final angka = TextEditingController();
  final pangkat = TextEditingController();
  final PowOperation output = PowOperation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator Pangkat')),
      drawer: MyDrawer(),
      body: Column(
        children: [
          GenericTextInput(
            textHint: "Masukkan angka",
            controller: angka,
            margin: EdgeInsets.all(10),
          ),
          GenericTextInput(
            textHint: "Masukkan pangkat",
            controller: pangkat,
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          ),
          GenericButton(
              text: "Calculate",
              onPressed: () {
                final input1 = double.tryParse(angka.text) ?? 0.0;
                final input2 = double.tryParse(pangkat.text) ?? 0.0;

                context
                    .read<InputHolderBloc>()
                    .add(UpdateInputs(input1, input2));
                output.doOperation(input1, input2);
              }),
          Text("Results:"),
          BlocBuilder<PowOperation, double>(
              bloc: output,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: TextStyle(fontSize: 46),
                );
              }),
        ],
      ),
    );
  }
}
