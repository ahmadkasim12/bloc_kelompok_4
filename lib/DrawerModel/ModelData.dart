import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modeldata{
  final Icon icon;
  final String listName;
  final BuildContext context;
  final VoidCallback onTap;

  Modeldata(this.context, {required this.icon, required this.listName, required this.onTap});
}
