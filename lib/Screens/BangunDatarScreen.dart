import 'package:bloc_implementation_assignment/bloc/bloc_bangundatar/input_bgndtar.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_bangundatar/operatordatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/GenericButton.dart';
import '../Widgets/GenericTextField.dart';
import '../Widgets/Drawer.dart';
import '../bloc/bloc_aritmatika/input_bloc.dart';

class BangunDatarPage extends StatelessWidget {
  BangunDatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Operatordatar bangunDatar = Operatordatar();
    operatorBangunDatar outputArea = operatorBangunDatar();
    final TextEditingController _input1Controller = TextEditingController();
    final TextEditingController _input2Controller = TextEditingController();

    List<String> _listBangunDatar = listBangunDatar().operator;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Bangun Datar"),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Column(
          children: [
            GenericTextInput(
              textHint: 'Input 1',
              controller: _input1Controller,
              margin: const EdgeInsets.all(10),
            ),
            GenericTextInput(
              textHint: 'Input 2 (Opsional)',
              controller: _input2Controller,
              margin: const EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
            ),
            BlocBuilder<Operatordatar, int>(
                bloc: bangunDatar,
                builder: (context, state) {
                  return DropdownButton<String>(
                    items: _listBangunDatar
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _listBangunDatar[state],
                    onChanged: (value) {
                      int selectedIndex = _listBangunDatar.indexOf(value!);
                      bangunDatar.setIndex(selectedIndex);
                    },
                  );
                }),
            GenericButton(
              onPressed: () {
                final input1 = double.tryParse(_input1Controller.text) ?? 0.0;
                final input2 = double.tryParse(_input2Controller.text) ?? 0.0;

                context
                    .read<InputHolderBloc>()
                    .add(UpdateInputs(input1, input2));
                outputArea.calculateArea(input1, input2, bangunDatar.init);
              },
              text: "Calculate",
            ),
            Text("Hasil:"),
            BlocBuilder<operatorBangunDatar, double>(
                bloc: outputArea,
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: const TextStyle(fontSize: 46),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
