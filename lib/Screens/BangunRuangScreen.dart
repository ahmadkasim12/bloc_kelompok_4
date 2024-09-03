import 'package:bloc_implementation_assignment/Widgets/Drawer.dart';
import 'package:flutter/material.dart';

import '../DrawerModel/Adaptor.dart';
import '../DrawerModel/DrawerItemList.dart';
import '../DrawerModel/ModelData.dart';

class Bangunruangscreen extends StatelessWidget {
  const Bangunruangscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Bangun Ruang"),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container()),
            Center(
              child: Container(
                color: Colors.black54,
                width: 200,
                height: 200,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Input 1',
              ),
            ),
            OutlinedButton(
                onPressed: () {},
                child: Text("Calculate")
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
