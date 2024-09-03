import 'package:flutter/cupertino.dart';
import 'ModelData.dart';

class Draweritemlist {
  final BuildContext context;

  Draweritemlist(this.context);

  List<Modeldata> get itemList => [
    Modeldata(
      context,
      listName: "Kalkulator Aritmatika",
      onTap: () {
        Navigator.pushNamed(context, '/arimatika');
      },
    ),
    Modeldata(
      context,
      listName: "Kalkulator Bangun Ruang",
      onTap: () {
        Navigator.pushNamed(context, '/bangunruang');
      },
    ),
    Modeldata(
      context,
      listName: "Kalkulator Bangun Datar",
      onTap: () {
        Navigator.pushNamed(context, '/bangundatar');
      },
    ),
  ];
}
