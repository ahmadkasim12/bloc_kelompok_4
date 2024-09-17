import 'package:bloc_implementation_assignment/Widgets/GenericButton.dart';
import 'package:bloc_implementation_assignment/Widgets/GenericTextField.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_aritmatika/operator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_aritmatika/input_event.dart';
import '../Widgets/Drawer.dart';

class Aritmatikapage extends StatelessWidget {
  Aritmatikapage({super.key});

  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();

  Operator aritmatika = Operator();
  InputOperation output = InputOperation();
  List<String> operator = new operatorAritmatika().operator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Aritmatika"),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Meow"),
                    ],
                  ),
                  GenericTextInput(
                      textHint: "Input 1",
                      controller: _input1Controller,
                      margin: EdgeInsets.only(bottom: 10, top: 10)),
                  GenericTextInput(
                      textHint: "Input 2",
                      controller: _input2Controller,
                      margin: EdgeInsets.only(bottom: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BlocBuilder<Operator, int>(
                        bloc: aritmatika,
                        builder: (context, state) {
                          return DropdownButton<String>(
                              items: operator.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                              value: operator[state],
                              onChanged: (value) {
                                int selectedIndex = operator.indexOf(value!);
                                aritmatika.setIndex(selectedIndex);
                              });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenericButton(
                          onPressed: () {
                            final input1 =
                                double.tryParse(_input1Controller.text) ?? 0.0;
                            final input2 =
                                double.tryParse(_input2Controller.text) ?? 0.0;

                            context
                                .read<InputHolderBloc>()
                                .add(UpdateInputs(input1, input2));
                            output.doOperation(input1, input2, aritmatika.init);
                          },
                          text: "Calculate"),
                      BlocBuilder<InputOperation, double>(
                        bloc: output,
                        builder: (context, state) {
                          return Text('Hasil: $state');
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
