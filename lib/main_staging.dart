import 'package:flutter/material.dart';
import 'package:song_social/main.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.staging;
  runApp(MyApp());
}
