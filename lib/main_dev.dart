import 'package:flutter/material.dart';
import 'package:startup_app/main.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.dev;
  print('dev');
  runApp(MyApp());
}
