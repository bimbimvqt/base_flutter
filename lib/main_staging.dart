import 'package:flutter/material.dart';
import 'package:startup_app/main.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.staging;
  runApp(MyApp());
}
