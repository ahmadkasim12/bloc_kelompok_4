import 'package:bloc_implementation_assignment/DrawerModel/ModelData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Adaptor extends StatelessWidget {
  final Modeldata data;
  const Adaptor({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: data.icon,
      title: Text(data.listName),
      onTap: data.onTap,
    );
  }
}
