import 'package:flutter/material.dart';

import '../DrawerModel/Adaptor.dart';
import '../DrawerModel/DrawerItemList.dart';
import '../DrawerModel/ModelData.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Modeldata> modelData = Draweritemlist(context).itemList;
    return Drawer(
      child: ListView.builder(
        itemCount: modelData.length,
        itemBuilder: (context, index){
          return Adaptor(data: modelData[index]);
        },
      ),
    );
  }
}
