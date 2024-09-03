import 'package:bloc_implementation_assignment/Widgets/Drawer.dart';
import 'package:bloc_implementation_assignment/Widgets/GenericButton.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_datar/input_datar.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_datar/lingkaran.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_datar/persegi_panjang.dart';
import 'package:bloc_implementation_assignment/bloc/bloc_datar/segitiga.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widgets/GenericTextField.dart';

class Bangundatarscreen extends StatelessWidget {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _ruasController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();

  KalkulasiPersegiPanjang outputPersegiPanjang = KalkulasiPersegiPanjang();
  KalkulasiLingkaran outputLingkaran = KalkulasiLingkaran();
  KalkulasiSegitiga outputSegitiga = KalkulasiSegitiga();

  Bangundatarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      Text("Persegi Panjang"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenericButton(
                          onPressed: () {
                            final inputPanjang =
                                double.tryParse(_panjangController.text) ?? 0.0;
                            final inputLebar =
                                double.tryParse(_lebarController.text) ?? 0.0;
                            context.read<InputHolderBloc3>().add(
                                UpdateInputs(inputPanjang, inputLebar, 0, 0));
                            outputPersegiPanjang.doOperation(inputPanjang,
                                inputLebar); // Selected index 0 untuk balok
                          },
                          text: "Calculate"),
                      Text("Hasil:"),
                      BlocBuilder<KalkulasiPersegiPanjang, double>(
                        bloc: outputPersegiPanjang,
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
                      Text("Segitiga"),
                    ],
                  ),
                  GenericTextInput(
                      textHint: "Sisi",
                      controller: _sisiController,
                      margin: EdgeInsets.only(bottom: 10, top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenericButton(
                          onPressed: () {
                            final inputSisi =
                                double.tryParse(_sisiController.text) ?? 0.0;
                            context
                                .read<InputHolderBloc3>()
                                .add(UpdateInputs(inputSisi, 0, 0, 0));
                            outputSegitiga.doOperation(
                                inputSisi); // Selected index 0 untuk balok
                          },
                          text: "Calculate"),
                      Text("Hasil:"),
                      BlocBuilder<KalkulasiSegitiga, double>(
                        bloc: outputSegitiga,
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
                      Text("Lingkaran"),
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
                                .read<InputHolderBloc3>()
                                .add(UpdateInputs(inputRuas, 0, 0, 0));
                            outputLingkaran.doOperation(
                                inputRuas); // Selected index 0 untuk balok
                          },
                          text: "Calculate"),
                      Text("Hasil:"),
                      BlocBuilder<KalkulasiLingkaran, double>(
                        bloc: outputLingkaran,
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
