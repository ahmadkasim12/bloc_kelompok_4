import 'package:bloc_implementation_assignment/Widgets/Drawer.dart';
import 'package:bloc_implementation_assignment/Widgets/GenericButton.dart';
import 'package:bloc_implementation_assignment/Widgets/GenericTextField.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Perpangkatan extends StatefulWidget {
  const Perpangkatan({super.key});

  @override
  State<Perpangkatan> createState() => _PerpangkatanState();
}

class _PerpangkatanState extends State<Perpangkatan> {
  final angka = TextEditingController();
  final pangkat = TextEditingController();
  String result = "";

  void calculatorLogic() {
    final number = double.tryParse(angka.text) ?? 0;
    final exponent = double.tryParse(pangkat.text) ?? 0;
    setState(() {
      result = pow (number,(exponent)).toString();
    });
  }
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

            GenericButton(text: "Hasil", onPressed: calculatorLogic),

            SizedBox(height: 20),
            Text(
              "Hasil: $result",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}