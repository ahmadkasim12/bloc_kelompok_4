import 'package:flutter/material.dart';
import 'ModelData.dart';

class Draweritemlist {
  final BuildContext context;

  Draweritemlist(this.context);

  List<Modeldata> get itemList => [
    Modeldata(
      icon: Icon(Icons.numbers),
      context,
      listName: "Aritmatika",
      onTap: () {
        Navigator.pushNamed(context, '/arimatika');
      },
    ),
    Modeldata(
      icon: Icon(Icons.square_outlined),
      context,
      listName: "Bangun Ruang",
      onTap: () {
        Navigator.pushNamed(context, '/bangunruang');
      },
    ),
    Modeldata(
      icon: Icon(Icons.circle_outlined),
      context,
      listName: "Bangun Datar",
      onTap: () {
        Navigator.pushNamed(context, '/bangundatar');
      },
    ),
    Modeldata(
      icon: Icon(Icons.power_outlined),
      context,
      listName: "Perpangkatan",
      onTap: () {
        Navigator.pushNamed(context, '/perpangkatan');
      },
    ),
  ];
}
