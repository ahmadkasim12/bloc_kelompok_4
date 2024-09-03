import 'package:bloc_implementation_assignment/Widgets/Drawer.dart';
import 'package:bloc_implementation_assignment/Widgets/GenericButton.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_bangun_ruang/balok.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_bangun_ruang/bola.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_bangun_ruang/input-ruang.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_bangun_ruang/kubus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widgets/GenericTextField.dart';

class Bangunruangscreen extends StatelessWidget {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _alasController = TextEditingController();
  final TextEditingController _ruasController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  KalkulasiBalok outputBalok = KalkulasiBalok();
  KalkulasiBola outputBola = KalkulasiBola();
  KalkulasiKubus outputKubus = KalkulasiKubus();

  Bangunruangscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Bangun Ruang"),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            // Balok
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
                      Text("Balok"),
                    ],
                  ),
                  GenericTextInput(
                      textHint: "Panjang",
                      controller: _panjangController,
                      margin: EdgeInsets.only(bottom: 10, top: 10)),
                  GenericTextInput(
                      textHint: "Lebar",
                      controller: _lebarController,
                      margin: EdgeInsets.only(bottom: 10)),
                  GenericTextInput(
                      textHint: "Tinggi",
                      controller: _tinggiController,
                      margin: EdgeInsets.only(bottom: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenericButton(
                          onPressed: () {
                            final inputPanjang =
                                double.tryParse(_panjangController.text) ?? 0.0;
                            final inputLebar =
                                double.tryParse(_lebarController.text) ?? 0.0;
                            final inputTinggi =
                                double.tryParse(_tinggiController.text) ?? 0.0;
                            context.read<InputHolderBloc2>().add(UpdateInputs(
                                inputPanjang, inputLebar, inputTinggi, 0, 0));
                            outputBalok.doOperation(inputPanjang, inputLebar,
                                inputTinggi); // Selected index 0 untuk balok
                          },
                          text: "Calculate"),
                      Text("Hasil:"),
                      BlocBuilder<KalkulasiBalok, double>(
                        bloc: outputBalok,
                        builder: (context, state) {
                          return Text(
                            '$state',
                            style: TextStyle(fontSize: 30),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Kubus"),
                    ],
                  ),
                  GenericTextInput(
                      textHint: "Alas (Sisi Kubus)",
                      controller: _alasController,
                      margin: EdgeInsets.only(bottom: 10, top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenericButton(
                          onPressed: () {
                            final inputAlas =
                                double.tryParse(_alasController.text) ?? 0.0;
                            context
                                .read<InputHolderBloc2>()
                                .add(UpdateInputs(inputAlas, 0, 0, 0, 0));
                            outputKubus.doOperation(
                                inputAlas); // Selected index 0 untuk balok
                          },
                          text: "Calculate"),
                      Text("Hasil:"),
                      BlocBuilder<KalkulasiKubus, double>(
                        bloc: outputKubus,
                        builder: (context, state) {
                          return Text(
                            '$state',
                            style: TextStyle(fontSize: 30),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            // Bola
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Bola"),
                    ],
                  ),
                  GenericTextInput(
                      textHint: "Jari-Jari (Ruas)",
                      controller: _ruasController,
                      margin: EdgeInsets.only(bottom: 10, top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenericButton(
                          onPressed: () {
                            final inputRuas =
                                double.tryParse(_ruasController.text) ?? 0.0;
                            context
                                .read<InputHolderBloc2>()
                                .add(UpdateInputs(inputRuas, 0, 0, 0, 0));
                            outputBola.doOperation(
                                inputRuas); // Selected index 0 untuk balok
                          },
                          text: "Calculate"),
                      Text("Hasil:"),
                      BlocBuilder<KalkulasiBola, double>(
                        bloc: outputBola,
                        builder: (context, state) {
                          return Text(
                            '$state',
                            style: TextStyle(fontSize: 30),
                          );
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
