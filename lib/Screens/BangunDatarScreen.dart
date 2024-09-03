import 'package:flutter/material.dart';

import '../Widgets/Drawer.dart';

class Bangundatarscreen extends StatelessWidget {
  const Bangundatarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Bangun Datar"),
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
