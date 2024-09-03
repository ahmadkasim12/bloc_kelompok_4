import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Modeldata{
  final String listName;
  final BuildContext context;
  final VoidCallback onTap;

  Modeldata(this.context, {required this.listName, required this.onTap});
}
