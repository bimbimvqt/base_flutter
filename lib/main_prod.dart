import 'package:flutter/material.dart';
import 'package:startup_app/main.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.prod;
  print('prod');
  runApp(MyApp());
}
