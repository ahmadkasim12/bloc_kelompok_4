import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/Drawer.dart';
import '../Widgets/GenericButton.dart';
import '../Widgets/GenericTextField.dart';
import '../bloc/bloc_aritmatika/input_bloc.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GenericTextInput(textHint: "Masukkan angka", controller: angka, margin: EdgeInsets.zero,),
            GenericTextInput(textHint: "Masukkan pangkat", controller: pangkat, margin: EdgeInsets.zero,),

            SizedBox(height: 20),

            GenericButton(text: "Hasil", onPressed: () {
              final input1 = double.tryParse(angka.text) ?? 0.0;
              final input2 = double.tryParse(pangkat.text) ?? 0.0;

              context.read<InputHolderBloc>().add(UpdateInputs(input1, input2));
              output.doOperation(input1, input2);
            }),

            SizedBox(height: 20),
            BlocBuilder<PowOperation, double>(
              builder: (context, state) {
                return Text(
                  "Hasil: $state",
                  style: TextStyle(fontSize: 24),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}